#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=
AS=as

# Macros
CND_PLATFORM=GNU-Linux-x86
CND_CONF=Release
CND_DISTDIR=dist

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=build/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/main.o \
	${OBJECTDIR}/PEParser.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-L/usr/lib -L/usr/local/lib -L../libmelter ../libmelter/dist/Debug/GNU-Linux-x86/liblibmelter.a ../libmelter/dist/Release/GNU-Linux-x86/liblibmelter.a -lboost_filesystem -lboost_regex -lboost_system -lboost_program_options -lcrypto

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-Release.mk dist/Release/GNU-Linux-x86/melter

dist/Release/GNU-Linux-x86/melter: ../libmelter/dist/Debug/GNU-Linux-x86/liblibmelter.a

dist/Release/GNU-Linux-x86/melter: ../libmelter/dist/Release/GNU-Linux-x86/liblibmelter.a

dist/Release/GNU-Linux-x86/melter: ${OBJECTFILES}
	${MKDIR} -p dist/Release/GNU-Linux-x86
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/melter ${OBJECTFILES} ${LDLIBSOPTIONS} 

${OBJECTDIR}/main.o: main.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I/usr/include -I/usr/local/include -I../libmelter -MMD -MP -MF $@.d -o ${OBJECTDIR}/main.o main.cpp

${OBJECTDIR}/PEParser.o: PEParser.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I/usr/include -I/usr/local/include -I../libmelter -MMD -MP -MF $@.d -o ${OBJECTDIR}/PEParser.o PEParser.cpp

# Subprojects
.build-subprojects:
	cd ../libmelter && ${MAKE}  -f Makefile CONF=Debug
	cd ../libmelter && ${MAKE}  -f Makefile CONF=Release

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Release
	${RM} dist/Release/GNU-Linux-x86/melter

# Subprojects
.clean-subprojects:
	cd ../libmelter && ${MAKE}  -f Makefile CONF=Debug clean
	cd ../libmelter && ${MAKE}  -f Makefile CONF=Release clean

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
