# api/views.py

import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from api.model.inference import Model

_model_instance = None

def get_model():
    """
    Fungsi untuk memuat model hanya sekali saat pertama kali dipanggil.
    Ini disebut lazy loading.
    """
    global _model_instance
    if _model_instance is None:
        print("Loading rose disease model (TFLite)...") 
        model_path = 'api/model/garden/rose_model_float32.tflite'
        _model_instance = Model.from_path(model_path)
    return _model_instance

labels = [
    'Healthy_Leaf_Rose', 
    'Rose_Rust', 
    'Rose_sawfly_Rose_slug'
]

@csrf_exempt
def predict(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))
            user_data = data.get('data')

            if user_data is None:
                return JsonResponse({'error': 'No data provided'}, status=400)
            
            model = get_model()
            prediction = model.predict_from_data(user_data)

            return JsonResponse({'message': 'Data received', 'prediction': prediction}, status=200)
        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON format'}, status=400)
    else:
        return JsonResponse({'error': 'This endpoint only supports POST requests.'}, status=405)
    
@csrf_exempt
def predict_image(request):
    if request.method == 'POST':
        try:
            image_file = request.FILES.get('image')

            if image_file is None:
                return JsonResponse({'error': 'No image provided. Please send an image with the key "image".'}, status=400)
            
            model = get_model()
            
            predicted_class_index, confidence = model.predict_from_image(image_file)
            predicted_class_label = labels[predicted_class_index]

            return JsonResponse({
                'message': 'Prediction successful',
                'prediction': {
                    'class': predicted_class_label,
                    'confidence': round(confidence, 4)
                }
            }, status=200)
        except Exception as e:
            return JsonResponse({'error': f'An error occurred during prediction: {str(e)}'}, status=500)
    else:
        return JsonResponse({'error': 'This endpoint only supports POST requests.'}, status=405)