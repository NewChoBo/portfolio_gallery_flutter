# portfolio_gallery_flutter

## 개요
취준생때 일일히 포트폴리오를 보여주기 위해 ppt 만드는것도 낭비라고 느꼈다.
그냥 게시글 쓰듯이 사진만 툭툭 올리면 되는거 아닌가.

그냥 전용 블로그 생기는것 이상도 이하도 아니겠지만.



## 환경 구축
기본적으로 플러터 환경은 구축하였음.

- vs code extensions
    * Dart, Flutter extension 
    * Widget Inspector(실행 후 나오는 가장 오른쪽 플러터 버튼)도 활용 가능
    * formatting을 위해 코드 끝날 때마다 ','로 끝내기

- firebase 준비
    * firebase의 Authentication 기능 설치
    * Firebase CLI 설치

## 실행방법
?????

## 일지

## 필요 지식, 팁
뭔가 필요할 땐 공식문서를 참고해보자. (위젯같은 것들...)
https://docs.flutter.dev/ui/widgets/text 에서 접속 가능

Ctrl + spacebar, Ctrl + '.'

context?

변수 선언할 때 ?
ex) String name = "default"; => String? name;

named parameter와 순서 parameter
required? optional?

theme에서 색상 꺼내오기 : Theme.of(context).dialogBackgroundColor

MaterialApp, CupertinoApp
MaterialApp: 안드로이드 느낌
CupertinoApp: ios 느낌



row와 column, mainAxis, crossAxis...

text withOpacity는 상위 컴포넌트에 const 있으면 안됨

설정(톱니바퀴) -> command palette -> open user settings 
settings.json에서 

    "editor.codeActionsOnSave": {
        "source.fixAll": true
    },

추가 (저장시 const 붙여주고, import 지워줄꺼임)
+ 기타 등등

...전체
```
{
    "[dart]": {
        "editor.formatOnSave": true,
        "editor.formatOnType": true,
        "editor.rulers": [
            80
        ],
        "editor.selectionHighlight": false,
        "editor.suggestSelection": "first",
        "editor.tabCompletion": "onlySnippets",
        "editor.wordBasedSuggestions": false
    },
    "editor.codeActionsOnSave": {   // 저장시 const 자동으로 붙여줌
        "source.fixAll": true
    },
    "dart.previewFlutterUiGuides": true,
    "dart.openDevTools": "flutter",
    "dart.debugExternalPackageLibraries": true,
    "dart.debugSdkLibraries": false,
    "emmet.excludeLanguages": ["markdown", "jsx"],
    // "window.zoomLevel": 5,
    // "go.toolsManagement.autoUpdate": true,



    "git.autofetch": true
}
```

code Actions, 전구, ctrl + space, ctrl + .

확장 Error Lens 설치

위젯 extraction, props,

singlechildscroll

stateful widget은 lifecycle을 가지고있다. 이벤트에 반응
initState(단 한번만) -> build

Hero : tag만 같으면 됨
네비게이션, 라우터 이해 필요

https://pub.dev/ 참조
https://pub.dev/packages/url_launcher
flutter pub add url_launcher로 웹 열게 할 수 있음.

flutter pub add shared_preferences
shared_preferences : 사용자 기기에 데이터 저장

휴대폰 연결이 잘 안될 때
adb kill-server
adb start-server