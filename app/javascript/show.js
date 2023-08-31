document.addEventListener('turbo:load', function(){
  const mainImage = document.getElementById('main-image');
  const previewImages = document.querySelectorAll('.preview-img');
  
  previewImages.forEach(img => {
    img.addEventListener('click', function(){
      mainImage.src = this.src;
    });
  });
});
