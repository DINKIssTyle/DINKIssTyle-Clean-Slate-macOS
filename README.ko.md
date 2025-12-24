# Clean Slate (클린 슬레이트)

Clean Slate는 깔끔한 스크린샷 촬영이나 작업 집중을 위해 바탕화면의 아이콘과 배경화면을 단색으로 가려주는 macOS 유틸리티 앱입니다.

<div align="center">
  <img src="Resources/Appicon.png" width="128" alt="Clean Slate Icon">
</div>

## 주요 기능
- **데스크탑 오버레이**: 바탕화면 아이콘과 배경을 깔끔한 단색 창으로 덮어줍니다.
- **색상 사용자화**: 원하는 배경 색상을 자유롭게 선택할 수 있습니다.
- **설정 저장**: 마지막으로 사용한 색상을 기억합니다.
- **다중 모니터 지원**: 연결된 모든 모니터를 자동으로 감지하여 커버합니다.
- **메뉴바 앱**: 독(Dock) 공간을 차지하지 않고 메뉴바에서 조용히 실행됩니다.

## 설치 방법

1. [GitHub Releases](../../releases) 페이지에서 최신 버전을 다운로드하세요.
2. 압축을 풀고 `Clean Slate.app`을 `응용 프로그램 (Applications)` 폴더로 이동합니다.

### "앱이 손상되었거나 열 수 없습니다" 오류 해결 (Gatekeeper 우회)
Apple의 공증을 받지 않은 앱이므로 실행 시 보안 경고가 뜰 수 있습니다. 터미널에서 다음 명령어를 입력하여 이를 해결할 수 있습니다.

1. **터미널(Terminal)** 앱을 실행합니다.
2. 아래 명령어를 입력하고 엔터를 누르세요 (앱이 응용 프로그램 폴더에 있다고 가정):
   ```bash
   xattr -cr /Applications/Clean\ Slate.app
   ```
   *만약 파일 위치가 다르다면 `/Applications/Clean\ Slate.app` 부분을 실제 앱 경로로 변경해주세요.*
3. 앱을 다시 실행하면 정상적으로 열립니다.

## 사용 방법
1. **Clean Slate**를 실행하면 메뉴바에 아이콘(네모 두 개가 겹친 모양)이 나타납니다.
2. 아이콘을 클릭하여 메뉴를 사용하세요:
    - **Toggle Show/Hide (보이기/숨기기)**: 바탕화면 덮개를 켜거나 끕니다.
    - **Pick Color... (색상 선택)**: 배경 색상을 변경합니다.
    - **About Clean Slate**: 앱 정보를 확인합니다.
    - **Quit (종료)**: 앱을 종료합니다.

## 시스템 요구사항
- macOS 11.0 (Big Sur) 이상
- Apple Silicon 또는 Intel Mac

## 라이선스
(C) 2025 DINKI'ssTyle
