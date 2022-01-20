# PROC-ECE Projet

<p align="center"><img width="300" src="https://user-images.githubusercontent.com/47628329/149769925-e40ed092-13f5-4d9f-af7d-b45a13ee76e4.png"></p>

En partenariat avec l'entreprise [SECAPEM](https://www.secapem.com), spécialisée dans l'électronique embarquée des systèmes d'entraînement au tir des forces armées terrestres et aériennes, l'objectif du projet est de concevoir sur FPGA un processeur de type d'architecture RISC-V permettant de remplacer le processeur JAP (Java Processor) actuellement utilisé. 

Le projet a aussi pour vocation de concevoir la trame d'un projet dédié aux futurs étudiants ingénieurs en Systèmes Embarqués dans le cadre de l'enseignement de VHDL.

Notre processeur est composé des différents blocs suivants :

### ALU
L’Unité Arithmétique et Logique (UAL) ou Arithmetic-Logic Unit (ALU) en anglais est un composant du processeur chargé d’effectuer les calculs. Une ALU peut être spécialisée, ou pas.

### Program Counter
Le Program Counter (PC) est un pointeur d'instruction. C'est un registre contenant l'emplacement de l'instruction en cours d'exécution.

### Data Memory
La data memory ou mémoire de données est un espace mémoire de masse dans lequel les données sont stockées ou récupérées. Chaque emplacement de cette zone mémoire stock 8 bits et est accessible avec une adresse de 32 bits soit 4 294 967 296 emplacements mémoires de 8 bits. Cette mémoire de masse permet de stocker des données depuis le banc de registres avec des instructions de Store et de récupérer ces informations stockées avec des instructions de Load.

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

# PROC-ECE Project

<p align="center"><img width="300" src="https://user-images.githubusercontent.com/47628329/149769925-e40ed092-13f5-4d9f-af7d-b45a13ee76e4.png"></p>

In partnership with the company [SECAPEM](https://www.secapem.com), specialized in on-board electronics for land and air armed forces shooting training systems, the objective of the project is to design on an FPGA a processor of the RISC-V architecture type making it possible to replace the currently used JAP (Java Processor).

The project also aims to design the framework of a project dedicated to future engineering students in Embedded Systems within the framework of VHDL teaching.

Our processor is made up of the following blocks:

### ALU
The arithmetic-logic unit is a component of the processor responsible for performing the calculations. An ALU can be specialized, or not.

### Program Counter
The Program Counter (PC) is an instruction pointer. It is a register containing the location of the instruction being executed.

### Data Memory
The Data memory is a mass memory space in which data is stored or retrieved. Each location in this memory area stores 8 bits and is accessible with a 32 bit address. It therefore has 4,294,967,296 8-bit memory locations. This mass memory enables to store data from the register file with Store instructions and to retrieve this stored information with Load instructions.

### Instruction Memory
The Instruction memory is used to create memory spaces for our instructions. It takes as input the clock as well as the reset useful for the operation of our entire architecture. As input, we will also find the signal produced by the program counter. The output will be the instruction that we would like to achieve using the architecture.

### Instruction Decoder
The decoder instruction is used to determine the operations to be performed based on the code of the instruction. It takes the 32-bit instruction signal as input and gives us as output the different parts of this signal that we will use in our architecture.

### Register File
The Register File is an array of 16 registers that can hold 32 bits. It is located in the processor and allows the recording of data from, for example, the ALU.
In addition, the RISC-V register file has the particularity of having the value 0 in the 1st register.

## Installation

To develop the processor architecture, we mainly used 2 software:

+ [Logisim](https://sourceforge.net/projects/circuit/) for design and link each block of the processor.

+ [Quartus Prime Lite](https://fpgasoftware.intel.com/?edition=lite) for translate the different blocks into VHDL, for simulate them with bench tests before testing everything on our FPGA Max 10.

## Use
You can simulate each processor block in the "Components-Tests" folder or the entire processor in the "RISC-V-Processor" folder. To do this, you will need to create a project in Quartus Prime Lite and add the ".vhd" files to it.


## License
[MIT](https://choosealicense.com/licenses/mit/)
