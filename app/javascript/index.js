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