//직사각형
const rectangle = document.querySelector('.rectangle');

// 버튼 클릭시 onClickButton() 실행
document.querySelector('.button').addEventListener('click', onClickButton);

//버튼 누를때마다 그라데이션 색상 변경
function onClickButton() {
    //0~359 사이의 임의의 수 가져오기
    const randomHue = Math.trunc(Math.random() * 360);
    //그라데이션의 시작과 끝 색상을 결정
    const randomColorStart = `hsl(${randomHue}, 100%, 50%)`;
    const randomColorEnd = `hsl(${randomHue + 40}, 100%, 50%)`;

    //직사각형의 그라데이션 처리 변수
    rectangle.style.setProperty('--start', randomColorStart);
    rectangle.style.setProperty('--end', randomColorEnd);
}