document.addEventListener('turbo:load', function () {
  // 新規投稿・編集ページのフォームを取得
  const postForm = document.getElementById('new_car');
  // プレビューを表示するためのスペースを取得
  const previewList = document.getElementById('previews');
  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!postForm) return null;

  // 投稿できる枚数の制限を定義
  const imageLimits = 6;

  // input要素を取得
  const fileField = document.querySelector('input[type="file"][name="car[images][]"]');
  const fileFieldContainer = fileField.parentElement;

  // input要素で値の変化が起きた際に呼び出される関数の中身
  const changedFileField = (e) => {
    const files = e.target.files;

    // 選択されたファイルを順番に処理
    for (let i = 0; i < files.length; i++) {
      const dataIndex = document.querySelectorAll(".preview").length;
      const file = files[i];

      // fileが空 = 何も選択しなかったので終了
      if (!file) {
        return null;
      };

      const blob = window.URL.createObjectURL(file);

      // 画像をプレビューに表示
      buildPreviewImage(dataIndex, blob);
      

      // 画像の枚数が最大のときに非表示にする
      if (document.querySelectorAll(".preview").length >= imageLimits) {
        fileFieldContainer.style.display = 'none';
      }
    }
  };

  

  // input要素で値の変化が起きた際に呼び出される関数
  fileField.addEventListener('change', changedFileField);

  // プレビュー画像を生成・表示する関数
  const buildPreviewImage = (dataIndex, blob) => {
    // 画像を表示するためのdiv要素を生成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    previewWrapper.setAttribute('data-index', dataIndex);

    // 表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);
    previewImage.setAttribute('width', '200'); // 幅を指定
    previewImage.setAttribute('height', '150'); // 高さを指定

    // 削除ボタンを生成
    const deleteButton = document.createElement("div");
    deleteButton.setAttribute("class", "image-delete-button");
    deleteButton.innerText = "削除";
    deleteButton.style.width = "45px"; // 幅を指定
    deleteButton.style.height = "30px"; // 高さを指定
    deleteButton.style.borderRadius = "20%"; // 丸くするための角丸の半径
    deleteButton.style.backgroundColor = "black"; // 背景色を赤色に設定
    deleteButton.style.color = "white"; // 白色の文字色に変更

    // 削除ボタンをクリックしたらプレビューを削除
    deleteButton.addEventListener("click", () => deleteImage(dataIndex));

    // 生成したHTMLの要素をブラウザに表示させる
    previewWrapper.appendChild(previewImage);
    previewWrapper.appendChild(deleteButton);
    previewList.appendChild(previewWrapper);

    
  };

  // 指定したdata-indexを持つプレビューとfile_fieldを削除する
  const deleteImage = (dataIndex) => {
    const deletePreviewImage = document.querySelector(`.preview[data-index="${dataIndex}"]`);
    deletePreviewImage.remove();

    // 画像の枚数が最大未満の場合、file_fieldを再表示
    if (document.querySelectorAll(".preview").length < imageLimits) {
      fileFieldContainer.style.display = 'flex';
    }
  };
});