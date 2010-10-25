/* 
 * File:   PEParser.h
 * Author: daniele
 *
 * Created on October 25, 2010, 12:10 PM
 */

#ifndef PEPARSER_H
#define	PEPARSER_H

#include "Parser.h"

class Chunk;

REGISTER_PARSER(PEParser);

class PEParser : public Parser {
public:
    PARSER(PEParser);

    PEParser();
    PEParser(const PEParser& orig);
    virtual ~PEParser();
    
private:

    bool parseDOSHeader( Chunk& chunk );
    bool parserNTHeader( Chunk& chunk );
};

#endif	/* PEPARSER_H */

