cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  mitral-rheumatic-valve-dz---primary:
    run: mitral-rheumatic-valve-dz---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  rheumatic-valve-dz-insufficiency---primary:
    run: rheumatic-valve-dz-insufficiency---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: mitral-rheumatic-valve-dz---primary/output
  rheumatic-valve-dz-incompetence---primary:
    run: rheumatic-valve-dz-incompetence---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: rheumatic-valve-dz-insufficiency---primary/output
  rheumatic-valve-dz-regurgitation---primary:
    run: rheumatic-valve-dz-regurgitation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: rheumatic-valve-dz-incompetence---primary/output
  aortic-rheumatic-valve-dz---primary:
    run: aortic-rheumatic-valve-dz---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: rheumatic-valve-dz-regurgitation---primary/output
  rheumatic-valve-dz-tricuspid---primary:
    run: rheumatic-valve-dz-tricuspid---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: aortic-rheumatic-valve-dz---primary/output
  pulmonary-rheumatic-valve-dz---primary:
    run: pulmonary-rheumatic-valve-dz---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: rheumatic-valve-dz-tricuspid---primary/output
  rheumatic-valve-dz-stenosis---primary:
    run: rheumatic-valve-dz-stenosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: pulmonary-rheumatic-valve-dz---primary/output
  rheumatic-valve-dz---primary:
    run: rheumatic-valve-dz---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: rheumatic-valve-dz-stenosis---primary/output
  rheumatic-valve-dz---secondary:
    run: rheumatic-valve-dz---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: rheumatic-valve-dz---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: rheumatic-valve-dz---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
