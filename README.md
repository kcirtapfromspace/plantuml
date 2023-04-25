# Fast & Easy C4 Diagrams with PlantUML

## Why C4 Diagrams

The C4 model is an easy to learn, developer friendly approach to software architecture diagramming. Good software architecture diagrams assist with communication inside/outside of software development/product teams, efficient onboarding of new staff, architecture reviews/evaluations, risk identification (e.g. risk-storming), threat modelling (e.g. STRIDE/LINDDUN), etc.

<https://c4model.com/>

## Why PlantUML

With [PlantUML](https://plantuml.com/) C4 diagrams are breeze to mock out.

## Local Setup
Setup a local alias
```sh
echo -n "alias plantuml='docker run -v $(pwd)/doc/design/assets/:/assets plantuml'" >> ~/.zshrc
```
## Generate PlantUML Diagrams GitHub Action
This GitHub Action automatically generates PlantUML diagrams and commits them back to your repository whenever there's a change in the specified directories containing PlantUML files.

### Prerequisites
Ensure that you have a Docker container that can generate PlantUML diagrams. This action assumes using the container for the repo ghcr.io/kcirtapfromspace/plantuml/plantuml:latest

The container should be available on a container registry like Docker Hub or GitHub Container Registry.

Usage
To use this action, follow these steps:

Create a .github/workflows directory in your repository if it doesn't already exist.

Create a new file in the .github/workflows directory named plantuml.yml.

Copy the contents below into the plantuml.yml file:

```yaml
name: Generate PlantUML diagrams

on:
  push:
    paths:
      - 'doc/design/**'
  pull_request:
    paths:
      - 'doc/design/**'

jobs:
  generate-diagrams:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v2
      with:
        fetch-depth: 0

    - name: Generate PlantUML diagrams
      run: |
        docker run --rm -v ${{ github.workspace }}/doc/design/assets:/assets ghcr.io/kcirtapfromspace/plantuml/plantuml:latest

    - name: Set up Git user
      run: |
        git config --local user.email "github-actions@users.noreply.github.com"
        git config --local user.name "GitHub Actions"

    - name: Commit generated diagrams
      run: |
        git add doc/design/assets
        git diff-index --quiet HEAD || git commit -m "Update generated PlantUML diagrams"
        git push
```
### Customization
To customize the action, you can modify the plantuml.yml file:

Change the paths option in the on section to watch different directories for changes.
Update the container name in the run command if you use a different container for generating PlantUML diagrams.
Modify the commit message in the "Commit generated diagrams" step by changing the text within the quotes after -m.
Remember to commit and push any changes to the plantuml.yml file for the modifications to take effect.

## Design Guide 
See the [design guide] for a quick example

[design guide]: doc/design/design.md "Optional Title Here"
