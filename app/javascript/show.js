/*選択画像の表示コード*/
document.addEventListener('turbo:load', function(){
  const mainImage = document.getElementById('main-image');
  const previewImages = document.querySelectorAll('.preview-img');
  
  previewImages.forEach(img => {
    img.addEventListener('click', function(){
      mainImage.src = this.src;
    });
  });
});


/*削除時にconfirmの表示*/
document.addEventListener('turbo:load', () => {
  document.getElementById('delete-button').addEventListener('click', (event) => {
    if (!confirm('削除するとデータの復元はできなくなります\n本当に削除しますか？')) {
      event.preventDefault();
    }
  });
});