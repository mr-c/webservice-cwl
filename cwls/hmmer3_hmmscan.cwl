#!/usr/bin/env cwl-runner

# Copyright (C) 2018 EMBL - European Bioinformatics Institute
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#      http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cwlVersion: v1.0
class: CommandLineTool
baseCommand: hmmer3_hmmscan_lwp.pl
hints:
  DockerRequirement:
    dockerPull: ebiwp/webservice-clients

inputs:

  # Web Service Clients: Common Entries
  email:
    type: string
    doc: "Submitter's email"
    inputBinding:
      prefix: --email

  title:
    type: string?
    inputBinding:
      prefix: --title

  jobid:
    type: string?
    inputBinding:
      prefix: --jobid

  polljob:
    type: boolean?
    inputBinding:
      prefix: --polljob

  outformat:
    type: string?
    inputBinding:
      prefix: --outformat

  pollfreq:
    type: int?
    inputBinding:
      prefix: --pollFreq

  params:
    type: boolean?
    inputBinding:
      prefix: --params
      position: 1

  paramdetails:
    type: string?
    inputBinding:
      prefix: --paramDetail

  # Web Service Clients: Different Entries
  sequence:
    type: File?
    inputBinding:
      position: 3
      prefix: --sequence
    default:
      class: File
      location: ../sequence/hmmer.seq

  alignView:
    type: string?
    inputBinding:
      position: 8
      prefix: --alignView

  dE:
    type: double?
    inputBinding:
      position: 15
      prefix: --E

  incE:
    type: double?
    inputBinding:
      position: 13
      prefix: --incE

  domE:
    type: double?
    inputBinding:
      position: 16
      prefix: --domE

  incdomE:
    type: double?
    inputBinding:
      position: 14
      prefix: --incdomE

#  dT:
#    type: double?
#    inputBinding:
#      position: 19
#      prefix: --T

#  incT:
#    type: double?
#    inputBinding:
#      position: 17
#      prefix: --incT

#  domT:
#    type: double?
#    inputBinding:
#      position: 20
#      prefix: --domT

#  incdomT:
#    type: double?
#    inputBinding:
#      position: 18
#      prefix: --incdomT

  cut_ga:
    type: string?
    inputBinding:
      position: 21
      prefix: --cut_ga

  nobias:
    type: string?
    inputBinding:
      position: 22
      prefix: --nobias

  hmmdb:
    type: string?
    inputBinding:
      position: 23
      prefix: --hmmdb


outputs:
  cwl_out:
    type: File[]
    streamable: true
    outputBinding:
      glob: "*.*"


$schemas:
  - http://schema.org/docs/schema_org_rdfa.html

$namespaces:
  s: http://schema.org/

s:license:
  - https://www.apache.org/licenses/LICENSE-2.0
  - https://spdx.org/licenses/Apache-2.0

s:copyrightHolder: "European Bioinformatics Institute (EMBL-EBI), Web Production"