<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="/static/style.css">
  </head>
  <body>
    <div>Mushroom Identifier</div>
    <button type="button" onclick="init()">Start</button>
    <button type="button" onclick="predict()">Predict</button>
    <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <div class="file-upload">
    <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )">Add Image</button>

    <div class="image-upload-wrap">
      <input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" />
      <div class="drag-text">
        <h3>Drag and drop a file or select add Image</h3>
      </div>
    </div>
    <div class="file-upload-content">
      <img class="file-upload-image" id='face-image' src="#" alt="your image" />
      <div class="image-title-wrap">
        <button type="button" onclick="removeUpload()" class="remove-image">Remove
          <span class="image-title">Uploaded Image</span>
        </button>
      </div>
    </div>
  </div>
  <div id="webcam-container"></div>
  <div id="label-container"></div>
  <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
  <script>
      function readURL(input) {
          if (input.files && input.files[0]) {
              var reader = new FileReader();
              reader.onload = function(e) {
                  $('.image-upload-wrap').hide();
                  $('.file-upload-image').attr('src', e.target.result);
                  $('.file-upload-content').show();
                  $('.image-title').html(input.files[0].name);
              };
              reader.readAsDataURL(input.files[0]);
          } else {
              removeUpload();
          }
      }

      function removeUpload() {
          $('.file-upload-input').replaceWith($('.file-upload-input').clone());
          $('.file-upload-content').hide();
          $('.image-upload-wrap').show();
      }
      $('.image-upload-wrap').bind('dragover', function() {
          $('.image-upload-wrap').addClass('image-dropping');
      });
      $('.image-upload-wrap').bind('dragleave', function() {
          $('.image-upload-wrap').removeClass('image-dropping');
      });
  </script>
  <script type="text/javascript">
      // More API functions here:
      // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image
      // the link to your model provided by Teachable Machine export panel
      const URL = "https://teachablemachine.withgoogle.com/models/bo3O9syNS/";
      let model, webcam, labelContainer, maxPredictions;
      // Load the image model and setup the webcam
      async function init() {
          const modelURL = URL + "model.json";
          const metadataURL = URL + "metadata.json";
          // load the model and metadata
          // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
          // or files from your local hard drive
          // Note: the pose library adds "tmImage" object to your window (window.tmImage)
          model = await tmImage.load(modelURL, metadataURL);
          maxPredictions = model.getTotalClasses();
          labelContainer = document.getElementById("label-container");
          for (let i = 0; i < maxPredictions; i++) { // and class labels
              labelContainer.appendChild(document.createElement("div"));
          }
      }
      // run the webcam image through the image model
      async function predict() {
          // predict can take in an image, video or canvas html element
          var image = document.getElementById("face-image")
          const prediction = await model.predict(image, false);
          for (let i = 0; i < maxPredictions; i++) {
              const classPrediction =
                  prediction[i].className + ": " + prediction[i].probability.toFixed(2);
              labelContainer.childNodes[i].innerHTML = classPrediction;
          }
      }
    </script>
  </body>
</html>