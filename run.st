log value: 'Installing Signals'.
(Smalltalk at: #Metacello) new
  baseline: 'Signals';
  repository: 'filetree:///repository';
  get;
  load.
