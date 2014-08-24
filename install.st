| log |

log := [:msg | | str |
    str := ' ---> ', msg.
    FileStream stdout nextPutAll: str; nextPut: Character lf; flush.
    Transcript cr; show: str].

log value: 'Installing filetree'.
Installer ss3
    project: 'FileTree';
    install: 'ConfigurationOfFileTree'.
((Smalltalk at: #ConfigurationOfFileTree) project version: '1.0') load.

log value: 'Installing OSProcess'.
Installer ss
    project: 'OSProcess';
    install: 'OSProcess-dtl.73'.

log value: 'Installing Metacello'.
(Smalltalk at: #Gofer) new
    url: 'http://seaside.gemtalksystems.com/ss/metacello/';
    package: 'ConfigurationOfMetacello';
    load.
((Smalltalk at: #ConfigurationOfMetacello) project
            version: #'previewBootstrap') load.

log value: 'Installing Metacello-work'.
(Smalltalk at: #Metacello) new
    configuration: 'MetacelloPreview';
    version: #'stable';
    repository: 'github://dalehenrich/metacello-work:configuration';
    get.

(Smalltalk at: #Metacello) new
    configuration: 'MetacelloPreview';
    version: #'stable';
    repository: 'github://dalehenrich/metacello-work:configuration';
    load.

log value: 'Installing Metacello-Git'.
Gofer new
    repository: (MCFileTreeRepository path: '/metacello-git/repository/');
    package: 'Metacello-Git';
    load.!

!MCVersionInfo methodsFor: 'accessing'!
date
    ^ date.! !
!MCVersionInfo methodsFor: 'accessing'!
time
    ^ time.! !

| log |

log := [:msg | | str |
    str := ' ---> ', msg.
    FileStream stdout nextPutAll: str; nextPut: Character lf; flush.
    Transcript cr; show: str].

log value: 'Installing SWA Utilities'.
(Installer monticello http: 'http://www.hpi.uni-potsdam.de/hirschfeld/squeaksource/SwaUtilities')
    addPackage: 'Icons';
    install.

log value: 'Installing SqueakSSL'.
(Installer monticello http: 'http://www.squeaksource.com/SqueakSSL')
    addPackage: 'SqueakSSL-Core';
    install.

log value: 'Installing Webclient'.
(Installer monticello http: 'http://www.squeaksource.com/MetacelloRepository')
    addPackage: 'ConfigurationOfWebClient';
    install.

log value: 'Done'.!







Smalltalk snapshot: true andQuit: true.
