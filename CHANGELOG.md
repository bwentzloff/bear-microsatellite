# Changelog

## October 16, 2026
Initial meeting between Brian from Research Computing and Heather from Puckett Lab to determine project specs. Heather followed up by sending Brian email specs and papers with examples of projects coming up.

## October 26, 2026
Setup initial directory structure. The idea was to have it conform to FAIR data principles, but also to work around the restrictions of the University of Memphis Big Blue specifications (/home is small and backed up, /project is medium and backed up, /scratch is large but NOT backed up).

## October 30, 2026
Some files had old hard-coded file directory references. I updated those to use the $USER variable instead of being hard-coded.