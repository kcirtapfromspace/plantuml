# Fast & Easy C4 Diagrams with PlantUML

## Why C4 Diagrams

The C4 model is an easy to learn, developer friendly approach to software architecture diagramming. Good software architecture diagrams assist with communication inside/outside of software development/product teams, efficient onboarding of new staff, architecture reviews/evaluations, risk identification (e.g. risk-storming), threat modelling (e.g. STRIDE/LINDDUN), etc.

<https://c4model.com/>

## Why PlantUML

With [PlantUML](https://plantuml.com/) C4 diagrams are breeze to mock out.

## Local Setup
Setup a local alias
echo -n 'export PATH=~/bin:$PATH' >> ~/.zshrc
`echo -n "alias plantuml='docker run -v $(pwd)/doc/design/assets/:/assets plantuml'" >> ~/.zshrc`