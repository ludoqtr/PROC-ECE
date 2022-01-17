# PROC-ECE Project

En partenariat avec l'entreprise [SECAPEM](https://www.secapem.com), spécialisée dans l'électronique embarquée des systèmes d'entraînement au tir des forces armées terrestres et aériennes, l'objectif du projet est de concevoir sur FPGA un processeur de type d'architecture RISC-V permettant de remplacer le processeur JAP (Java Processor) actuellement utilisé. 

Le projet a aussi pour vocation de concevoir la trame d'un projet dédié aux futurs étudiants ingénieurs en Systèmes Embarqués dans le cadre de l'enseignement de VHDL.

<img width="640" alt="Logo" src="https://user-images.githubusercontent.com/47628329/149768650-ff209ae0-fd19-4aae-9edd-0716ceb72796.png">

Notre processeur est composé des différents blocs suivants :

### ALU
L’Unité Arithmétique et Logique (UAL) ou Arithmetic-Logic Unit (ALU) en anglais est un composant du processeur chargé d’effectuer les calculs. Une ALU peut être spécialisée, ou pas.

### Program Counter
Le Program Counter (PC) est un pointeur d'instruction. C'est un registre contenant l'emplacement de l'instruction en cours d'exécution.
### Data Memory

### Instruction Memory
Le bloc instruction memory sert à créer des espaces mémoires pour nos instructions. Il prend en entrée la clock ainsi que le reset utile pour le fonctionnement de toute notre architecture. En entrée, nous retrouverons aussi le signal produit par le program counter. En sortie, on retrouvera l’instruction que nous aimerions réaliser à l’aide de l’architecture.

### Instruction Decoder
L’instruction decoder permet de déterminer les opérations à exécuter en fonction du code de l’instruction. Il prend en entrée le signal d’instruction de 32 bits et renvoie en sortie les différentes parties de ce signal que l’on utilisera dans notre architecture. 

### Register File
Le banc de registres ou “Register File” en anglais  est un tableau de 16 registres qui peuvent contenir 32 bits. Il est situé dans le processeur et permet d’enregistrer des données provenant par exemple de l’ALU. 
De plus, le banc de registres du RISC-V a la particularité d’avoir la valeur 0 dans le 1er registre.

## Installation

Pour développer l'architecture du processeur, nous avons utilisé 2 logiciels principalement :

+ [Logisim](https://sourceforge.net/projects/circuit/) pour concevoir chaque bloc du processeur puis les mettre en lien

+ [Quartus Prime Lite](https://fpgasoftware.intel.com/?edition=lite) pour traduire les différents blocs en VHDL, les simuler avec des tests benches avant de tester le tout sur notre FPGA Max 10.

## Usage
Vous pouvez simuler chaque block du processeur se trouvant dans le dossier "Components-Tests" ou le processeur en entier dans le dossier "RISC-V-Processor" en créer un projet sous Quartus Prime Lite et y ajouter les fichiers ".vhd".


## License
[MIT](https://choosealicense.com/licenses/mit/)
