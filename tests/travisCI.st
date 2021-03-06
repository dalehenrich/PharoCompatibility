"Load and run tests to be performed by TravisCI"
| gitPath |
Transcript cr; show: 'travis---->travisCI.st'.

gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

Metacello new
  baseline: 'PharoCompatibility';
  repository: 'filetree://', gitPath, '/PharoCompatibility/repository';
  onWarning: [:ex | 
    Transcript cr; show: ex description.
    ex resume ];
  load: 'Tests'.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfPharoCompatibility' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

