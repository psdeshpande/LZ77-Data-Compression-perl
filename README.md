LZ77-Data-Compression-perl
==========================

Implementation of LZ77 data compression algorithm in perl
- To compress file give following command from command prompt
  - perl lz77.perl -c TestFile.txt
    TestFile.txt --> This is file to be compressed
    
    This will generate file named compressed.txt 

- To decompress 
  - perl lz77.perl -d compressed.txt 
  
    This will generate decompressed.txt
