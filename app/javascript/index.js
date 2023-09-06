document.addEventListener('turbo:load', function() {
  const regions = document.querySelectorAll('.region');

  regions.forEach(function(region) {
    region.addEventListener('click', function() {
      const prefectures = document.getElementById(`${region.id}-prefectures`);
      if (prefectures.style.display === "none") {
        prefectures.style.display = "block";
      } else {
        prefectures.style.display = "none";
      }
    });
  });
});

document.addEventListener('turbo:load', function() {
  const makersSelect = document.getElementById('q_maker_eq');
  const modelsSelect = document.getElementById('model_select');
  const makerMakerSelect = document.getElementById('maker_maker');

  makersSelect.addEventListener('change', function() {
    const selectedMaker = this.value;
    const allMakersData = JSON.parse(this.dataset.makers);
    const modelOptions = [];

    // 空の選択肢を追加
    modelOptions.push(new Option('', ''));

    allMakersData.forEach(function(item) {
      if (item.maker === selectedMaker) {
        modelOptions.push(new Option(item.name, item.id));
      }
    });

    // model_select要素のオプションをクリアして新しいオプションを追加
    while (modelsSelect.firstChild) {
      modelsSelect.removeChild(modelsSelect.firstChild);
    }
    modelOptions.forEach(function(option) {
      modelsSelect.appendChild(option);
    });
    makerMakerSelect.value = this.value;
  });
});