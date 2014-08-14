| packages checkout metadata spec repo |

ScreenController new fullScreenOn.

checkout := '/checkout'.
metadata := '.packages'.
spec := checkout , FileDirectory slash, metadata.
repo := MCGitHubRepository2 path: checkout.

[
    packages := (FileStream readOnlyFileNamed: spec) contents lines.
] on: FileDoesNotExistException
  do: [
    | message |
    message := String streamContents: [ :s | s
        nextPutAll: '"Could not find package spec `' , spec , $', '"'; cr;
        nextPutAll: 'Gofer new'; crtab;
        nextPutAll: 'repository: (MCGithubRepository path:' , $' , '/checkout' , $' , ');'; crtab;
        nextPutAll: 'package: XXX;'; crtab;
        nextPutAll: 'load.'.
    ].

    Workspace new
        acceptContents: message;
        openLabel: 'Installation instructions'.
    ^ nil.
].

packages ifEmpty: [
    UIManager default inform: 'Your package spec `' , spec , $' , '" was empty.'.
    ^ nil.
].

packages do: [ :pkg |
    "XXX catch errors"
    Gofer new
        repository: repo;
        package: pkg;
        load.
    ] displayingProgress: [ :pkg | 'Installing ' , pkg ].
