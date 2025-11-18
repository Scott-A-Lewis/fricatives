# ipa_fricatives.R

ipa_fricatives_html <- function() {
  htmltools::HTML('
<style>
.ipachart-container {
  max-width: 100%;
  overflow-x: auto;
  -webkit-overflow-scrolling: touch;
  padding: 0.5rem 0;
}

/* IPA poster style */
.ipa-table {
  width: 100%;
  border-collapse: collapse;
  table-layout: fixed;
  font-size: 0.9rem;
  text-align: center;
  border: 2px solid black;
}

.ipa-table th {
  background-color: #e6e6e6;
  border: 1px solid black;
  padding: 6px;
  font-weight: bold;
}

.ipa-table td {
  border: 1px solid #888;
  padding: 2px 6px;
  vertical-align: middle;
  min-width: 45px;
}

/* Layout inside cells: left/right justification */
.cell-pair {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.play-btn {
  background: none;
  border: none;
  font-size: 1.1rem;
  cursor: pointer;
  line-height: 1;
  transition: transform 0.1s ease;
}

.play-btn:hover {
  transform: scale(1.2);
}

.voiceless { color: #005bbb; }
.voiced    { color: #009e3d; }
</style>

<div class="ipachart-container">
<table class="ipa-table" aria-label="IPA fricatives and lateral fricatives">
  <thead>
    <tr>
      <th></th>
      <th>Bilabial</th>
      <th>Labiodental</th>
      <th>Dental</th>
      <th>Alveolar</th>
      <th>Postalveolar</th>
      <th>Retroflex</th>
      <th>Palatal</th>
      <th>Velar</th>
      <th>Uvular</th>
      <th>Pharyngeal</th>
      <th>Glottal</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Fricative</td>
      <td><div class="cell-pair"><button class="play-btn voiceless" data-file="Voiceless_bilabial_fricative.mp3">ɸ</button><button class="play-btn voiced" data-file="Voiced_bilabial_fricative.mp3">β</button></div></td>
      <td><div class="cell-pair"><button class="play-btn voiceless" data-file="Voiceless_labiodental_fricative.mp3">f</button><button class="play-btn voiced" data-file="Voiced_labiodental_fricative.mp3">v</button></div></td>
      <td><div class="cell-pair"><button class="play-btn voiceless" data-file="Voiceless_dental_fricative.mp3">θ</button><button class="play-btn voiced" data-file="Voiced_dental_fricative.mp3">ð</button></div></td>
      <td><div class="cell-pair"><button class="play-btn voiceless" data-file="Voiceless_alveolar_fricative.mp3">s</button><button class="play-btn voiced" data-file="Voiced_alveolar_fricative.mp3">z</button></div></td>
      <td><div class="cell-pair"><button class="play-btn voiceless" data-file="Voiceless_postalveolar_fricative.mp3">ʃ</button><button class="play-btn voiced" data-file="Voiced_postalveolar_fricative.mp3">ʒ</button></div></td>
      <td><div class="cell-pair"><button class="play-btn voiceless" data-file="Voiceless_retroflex_fricative.mp3">ʂ</button><button class="play-btn voiced" data-file="Voiced_retroflex_fricative.mp3">ʐ</button></div></td>
      <td><div class="cell-pair"><button class="play-btn voiceless" data-file="Voiceless_palatal_fricative.mp3">ç</button><button class="play-btn voiced" data-file="Voiced_palatal_fricative.mp3">ʝ</button></div></td>
      <td><div class="cell-pair"><button class="play-btn voiceless" data-file="Voiceless_velar_fricative.mp3">x</button><button class="play-btn voiced" data-file="Voiced_velar_fricative.mp3">ɣ</button></div></td>
      <td><div class="cell-pair"><button class="play-btn voiceless" data-file="Voiceless_uvular_fricative.mp3">χ</button><button class="play-btn voiced" data-file="Voiced_uvular_fricative.mp3">ʁ</button></div></td>
      <td><div class="cell-pair"><button class="play-btn voiceless" data-file="Voiceless_pharyngeal_fricative.mp3">ħ</button><button class="play-btn voiced" data-file="Voiced_pharyngeal_fricative.mp3">ʕ</button></div></td>
      <td><div class="cell-pair"><button class="play-btn voiceless" data-file="Voiceless_gottal_fricative.mp3">h</button><button class="play-btn voiced" data-file="Voiced_gottal_fricative.mp3">ɦ</button></div></td>
    </tr>
    <tr>
      <td>Lateral Fricative</td>
      <td></td><td></td><td></td>
      <td><div class="cell-pair"><button class="play-btn voiceless" data-file="Voiceless_alveolar_lateral_fricative.mp3">ɬ</button><button class="play-btn voiced" data-file="Voiced_alveolar_lateral_fricative.mp3">ɮ</button></div></td>
      <td></td><td></td><td></td><td></td><td></td><td></td>
    </tr>
  </tbody>
</table>
</div>

<audio id="ipa-player" preload="none"></audio>

<script>
document.addEventListener("DOMContentLoaded", function () {
  const player = document.getElementById("ipa-player");
  document.querySelector(".ipachart-container").addEventListener("click", function(e) {
    const btn = e.target.closest(".play-btn");
    if(!btn) return;
    const file = btn.getAttribute("data-file");
    if(!file) return;
    try {
      if(!player.paused) {
        player.pause();
        player.currentTime = 0;
      }
      player.src = file;
      player.play().catch(err => console.warn("Playback failed:", err));
    } catch(err) {
      console.error("Audio play error", err);
    }
  });
});
</script>
  ')
}
