import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="player"
export default class extends Controller {
  static targets = [
    "video",
    "volume",
    "volumeIcon",
    "bar",
    "timer",
    "playButton",
  ];

  connect() {
    console.log(this.videoTarget);
  }

  previous() {
    console.log("prev");
  }

  next() {
    console.log("next");
  }

  playPause() {
    if (this.videoTarget.paused) {
      this.videoTarget.play();
      this.playButtonTarget.innerHTML = `
        <svg xmlns="http://www.w3.org/2000/svg" height="48" width="48"><path fill="#fff" d="M18.5 32H21.5V16H18.5ZM26.5 32H29.5V16H26.5ZM24 44Q19.9 44 16.25 42.425Q12.6 40.85 9.875 38.125Q7.15 35.4 5.575 31.75Q4 28.1 4 24Q4 19.9 5.575 16.25Q7.15 12.6 9.875 9.875Q12.6 7.15 16.25 5.575Q19.9 4 24 4Q28.1 4 31.75 5.575Q35.4 7.15 38.125 9.875Q40.85 12.6 42.425 16.25Q44 19.9 44 24Q44 28.1 42.425 31.75Q40.85 35.4 38.125 38.125Q35.4 40.85 31.75 42.425Q28.1 44 24 44ZM24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24ZM24 41Q31 41 36 36Q41 31 41 24Q41 17 36 12Q31 7 24 7Q17 7 12 12Q7 17 7 24Q7 31 12 36Q17 41 24 41Z"/></svg>
      `;
    } else {
      this.videoTarget.pause();
      this.playButtonTarget.innerHTML = `
        <svg xmlns="http://www.w3.org/2000/svg" height="48" width="48"><path fill="#fff" d="M19.15 32.5 32.5 24 19.15 15.5ZM24 44Q19.9 44 16.25 42.425Q12.6 40.85 9.875 38.125Q7.15 35.4 5.575 31.75Q4 28.1 4 24Q4 19.9 5.575 16.25Q7.15 12.6 9.875 9.875Q12.6 7.15 16.25 5.575Q19.9 4 24 4Q28.1 4 31.75 5.575Q35.4 7.15 38.125 9.875Q40.85 12.6 42.425 16.25Q44 19.9 44 24Q44 28.1 42.425 31.75Q40.85 35.4 38.125 38.125Q35.4 40.85 31.75 42.425Q28.1 44 24 44ZM24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24ZM24 41Q31 41 36 36Q41 31 41 24Q41 17 36 12Q31 7 24 7Q17 7 12 12Q7 17 7 24Q7 31 12 36Q17 41 24 41Z"/></svg>
      `;
    }
  }

  handleVolume() {
    this.videoTarget.volume = this.volumeTarget.value;
  }

  mute() {
    this.videoTarget.muted = !this.videoTarget.muted;

    if (this.videoTarget.muted) {
      this.volumeIconTarget.innerHTML = `
        <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40"><path fill="#fff" d="M33.583 37.667 28.25 32.333Q27.125 33.083 25.833 33.646Q24.542 34.208 23.125 34.542V31.667Q23.958 31.417 24.75 31.104Q25.542 30.792 26.25 30.333L19.792 23.875V33.333L11.458 25H4.792V15H10.917L2.125 6.208L4.125 4.25L35.542 35.667ZM32.458 28 30.458 26Q31.25 24.625 31.646 23.104Q32.042 21.583 32.042 19.958Q32.042 15.792 29.604 12.5Q27.167 9.208 23.125 8.25V5.375Q28.292 6.542 31.542 10.604Q34.792 14.667 34.792 19.958Q34.792 22.125 34.208 24.167Q33.625 26.208 32.458 28ZM15.375 19.458ZM26.875 22.417 23.125 18.667V13.25Q25.083 14.167 26.188 16Q27.292 17.833 27.292 20Q27.292 20.625 27.188 21.229Q27.083 21.833 26.875 22.417ZM19.792 15.333 15.458 11 19.792 6.667ZM17.042 26.583V21.125L13.708 17.792H7.583V22.208H12.667Z"/></svg>
      `;
    } else {
      this.volumeIconTarget.innerHTML = `
        <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40"><path fill="#fff" d="M23.333 34.542V31.667Q27.292 30.542 29.75 27.312Q32.208 24.083 32.208 19.958Q32.208 15.833 29.75 12.583Q27.292 9.333 23.333 8.25V5.375Q28.5 6.542 31.75 10.604Q35 14.667 35 19.958Q35 25.25 31.75 29.312Q28.5 33.375 23.333 34.542ZM5 25V15H11.667L20 6.667V33.333L11.667 25ZM22.792 26.875V13.042Q24.917 13.833 26.208 15.75Q27.5 17.667 27.5 20Q27.5 22.375 26.208 24.25Q24.917 26.125 22.792 26.875ZM17.208 13.583 12.875 17.792H7.792V22.208H12.875L17.208 26.458ZM13.208 20Z"/></svg>
      `;
    }
  }

  setTime() {
    const mediaTime = this.getTime(this.videoTarget);

    this.timerTarget.textContent = `${mediaTime} / ${this.duration}`;

    this.barTarget.style.width = `${this.getBarLength()}px`;
  }

  setDuration() {
    this.duration = this.getDuration();
    this.timerTarget.textContent = `00:00 / ${this.duration}`;
  }

  seek(e) {
    // TODO: convert range 0 - bar.clientWidth to 0 - video.duration
    const length = e.clientX - this.barTarget.parentElement.getBoundingClientRect().left;
    console.log(this.getTimeFromBarLength(length));
    console.log(this.videoTarget.currentTime);
  }

  getTime() {
    const minutes = Math.floor(this.videoTarget.currentTime / 60);
    const seconds = Math.floor(this.videoTarget.currentTime - minutes * 60);

    const minuteValue = minutes.toString().padStart(2, "0");
    const secondValue = seconds.toString().padStart(2, "0");

    return `${minuteValue}:${secondValue}`;
  }

  getBarLength() {
    return (
      this.barTarget.parentElement.clientWidth *
      (this.videoTarget.currentTime / this.videoTarget.duration)
    );
  }

  getTimeFromBarLength(length) {
    return (
      length /
      (this.videoTarget.currentTime / this.videoTarget.duration)
    );
  }

  getDuration() {
    const durationMinutes = Math.floor(this.videoTarget.duration / 60);
    const durationSeconds = Math.floor(
      this.videoTarget.duration - durationMinutes * 60
    );

    const durationMinuteValue = durationMinutes.toString().padStart(2, "0");
    const durationSecondValue = durationSeconds.toString().padStart(2, "0");

    return `${durationMinuteValue}:${durationSecondValue}`;
  }
}
