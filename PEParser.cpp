/* 
 * File:   PEParser.cpp
 * Author: daniele
 * 
 * Created on October 25, 2010, 12:10 PM
 */

#include "PEParser.h"
#include "Chunk.h"
#include "win32types.h"

PEParser::PEParser() {
    REGISTER_PARSE_ACTION( BufferDescriptor(0, sizeof(IMAGE_DOS_HEADER)), "dos_hedaer", &PEParser::parseDOSHeader);
}

PEParser::PEParser(const PEParser& orig) {
}

PEParser::~PEParser() {
}

bool parseDOSHeader( Chunk& chunk )
{
    PIMAGE_DOS_HEADER dosHeader = chunk.ptr();
    
    printf("[DOS Header] Signature        : %04x\n", dosHeader->e_magic);
    printf("[DOS Header] NT Header address: %08x\n", dosHeader->e_lfanew);

    REGISTER_PARSE_ACTION( BufferDescriptor(dosHeader->e_lfanew, sizeof(IMAGE_NT_HEADERS)), "nt_headers", &PEParser::parseNTHeaders);

    return true;
}

bool parseNTHeaders( Chunk& chunk )
{
    PIMAGE_NT_HEADERS ntHeaders = chunk.ptr();

    printf("[NT Headers] Signature : %08x\n", ntHeaders->Signature);
    printf("[NT Headers] SizeOfImage : %08x\n", ntHeaders->OptionalHeader.SizeOfImage);

    printf("Section alignment ... %08x", ntHeaders_->OptionalHeader.SectionAlignment);
    printf("File alignment    ... %08x", ntHeaders_->OptionalHeader.FileAlignment);
    printf("SizeOfImage       ... %08x", ntHeaders_->OptionalHeader.SizeOfImage);
    
    return true;
}
