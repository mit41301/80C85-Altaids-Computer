# Intel 80C85 Altaids Computer

Intel released the 8085 Microprocessor in March 1976. So by now it is more than 50 years. Like TIME MACHINE can be go back and build a 8085 computer? Even after fifty years we can still build a simple computer based on 8085.

8085 was over shadowed by Z80 and other eight bit microprocessors. But it found a place in College and University. That may be one of the reason it lasted for long time.


<img width="1488" height="992" alt="MCS-85_Resize" src="https://github.com/user-attachments/assets/70ab12cd-9e81-48dd-a4de-86918fd241e8" />

# MARS 
<img width="800" height="417" alt="image" src="https://github.com/user-attachments/assets/c334782d-0dd8-4e28-be4f-c4c3b7435c52" />

Dec. 4, 1996

About the mission
The Mars Pathfinder mission, designed to demonstrate a low-cost method for delivering a set of science instruments to the Red Planet, was the first wheeled vehicle to be used on any other planet in the solar system and served as the foundation for the Mars rovers of today.

The mission landed a rover -- Sojourner -- on the surface of Mars using an air bag landing system and innovative petal design, which have been used since in various incarnations to land other rovers on the Red Planet. Sojourner spent 83 days of a planned seven-day mission exploring the Martian terrain, snapping photographs and taking chemical, atmospheric and other measurements.



# Configuration:

I built my computer with 80C85 from OKI which consumes very less power compared to original D5085AH or P8085AH devices. The above design originally comes with 8kB RAM and 8kB EEPROM.  

In my above picture I have used DS1225 NVRAM, replacing both RAM and EEPROM ICs. It works fine and retains the code and data even after power failure. But the risk is the original ROM or EEPROM IC 27C64 or 28C64 connected with the processor WRite lines. So it allows the processor to write and alter the code in ROM address space ranging from 0000H to 1FFFH. 

 
    

<img width="987" height="1306" alt="image" src="https://github.com/user-attachments/assets/1422c0a1-fb00-426f-885c-bd13fba2893a" />

# A85 8085 cross-assembler

A85 8085 cross-assembler can be found from Herb Johnson's [SITE](https://www.retrotechnology.com/restore/a85.html) and it works on Windows 11!

command line: A85 altaidsRom.asm -l altaids.lst -o altaids.hex  
