#!/bin/sh

cd $(dirname $0)/../m68k
export SGDK=sgdk095
if [ -e ${SGDK} ]; then
  echo "SGDK already installed!"
  exit 1
fi
echo Fetching SGDK v095...
wget -qO- http://tiny.cc/umdk-${SGDK} | tar Jxf -

echo Patching...
cd ${SGDK}
cat > src/libres.s <<EOF
.text

    .align  2
logo_lib_palette_pal:
    dc.w    0x0000, 0x0222, 0x0444, 0x0666, 0x0888, 0x0AAA, 0x0CCC, 0x0EEE
    dc.w    0x0EEE

    .align  2
logo_lib_palette:
    dc.w    0, 9
    dc.l    logo_lib_palette_pal

    .align  2
logo_lib_image:
    dc.b    0x00, 0xA7, 0x01, 0x57, 0x71, 0x01, 0xC2, 0x3F, 0xC1, 0x23, 0x32, 0x10, 0x5E, 0x7F, 0xF0, 0x46
    dc.b    0x65, 0x42, 0x8F, 0xD0, 0x02, 0x57, 0x11, 0x66, 0x65, 0x21, 0xEE, 0x70, 0x05, 0x03, 0x66, 0x33
    dc.b    0x46, 0x53, 0x3C, 0xC2, 0x01, 0x38, 0x12, 0x22, 0xFF, 0x87, 0x78, 0x13, 0x65, 0x39, 0x11, 0x14
    dc.b    0x9D, 0x31, 0x01, 0x73, 0x6E, 0x21, 0xCC, 0x5E, 0x46, 0x23, 0x45, 0x56, 0x1E, 0x87, 0x40, 0x58
    dc.b    0x14, 0x64, 0x48, 0x10, 0x03, 0x74, 0x1C, 0x24, 0x45, 0x55, 0x46, 0x65, 0x54, 0x21, 0x16, 0xF2
    dc.b    0x66, 0x38, 0x77, 0x67, 0xA9, 0x62, 0x81, 0xDE, 0x31, 0x15, 0x63, 0x6A, 0x25, 0x77, 0x9C, 0x6C
    dc.b    0x76, 0x7A, 0x75, 0x0F, 0x64, 0x22, 0x24, 0x57, 0x01, 0x54, 0x32, 0x46, 0x73, 0x4E, 0x40, 0xB3
    dc.b    0x25, 0x18, 0xDA, 0x13, 0x47, 0x7C, 0x64, 0x43, 0x71, 0x33, 0x48, 0x34, 0x4A, 0x3D, 0x67, 0x78
    dc.b    0x71, 0x11, 0x21, 0x36, 0x63, 0xDE, 0x01, 0x25, 0x52, 0x23, 0x46, 0x67, 0x64, 0x42, 0x47, 0xFD
    dc.b    0x15, 0x01, 0x23, 0xBD, 0x74, 0xCF, 0x0F, 0x14, 0x40, 0xFA, 0x0A, 0x64, 0x56, 0x77, 0xF9, 0x23
    dc.b    0xB1, 0x28, 0x3D, 0xF8, 0x75, 0x62, 0x31, 0x0C, 0x47, 0x52, 0x9D, 0x40, 0xC8, 0xBC, 0x13, 0x54
    dc.b    0x2C, 0x00, 0x01, 0x1F, 0x13, 0x56, 0x64, 0x45, 0x02, 0x66, 0x41, 0x3B, 0x40, 0xC9, 0x64, 0x9E
    dc.b    0x3F, 0x88, 0xC3, 0x42, 0x13, 0x29, 0x76, 0x30, 0x3F, 0xD4, 0x12, 0x11, 0x46, 0x75, 0x6C, 0xEE
    dc.b    0x01, 0x14, 0x35, 0x65, 0x34, 0x40, 0xEE, 0x09, 0x24, 0x67, 0x52, 0x3C, 0xAD, 0x48, 0x02, 0x4E
    dc.b    0x12, 0x77, 0x31, 0x3A, 0xC0, 0xD8, 0x5C, 0x74, 0x20, 0xAF, 0x52, 0x1C, 0x77, 0x56, 0x65, 0x3A
    dc.b    0x93, 0xC2, 0x24, 0x76, 0x41, 0xBC, 0x2B, 0x16, 0x12, 0x57, 0x75, 0x48, 0x93, 0x11, 0x5D, 0xA8
    dc.b    0xAB, 0xA4, 0x3D, 0xED, 0x4F, 0x43, 0x7E, 0x02, 0x26, 0x73, 0x22, 0x45, 0x66, 0x43, 0x95, 0x41
    dc.b    0xE6, 0x13, 0x50, 0x80, 0xAB, 0x01, 0x34, 0x59, 0x30, 0x12, 0xF0, 0x20, 0x12, 0x44, 0xD0, 0x32
    dc.b    0xC3, 0xBA, 0x02, 0x15, 0x75, 0x23, 0x65, 0x20, 0xE1, 0x02, 0x51, 0x5E, 0xC1, 0x28, 0x66, 0x94
    dc.b    0x29, 0x11, 0x35, 0x82, 0x74, 0x80, 0xBF, 0x63, 0x14, 0xDC, 0x5A, 0xE4, 0x70, 0x2C, 0x92, 0xFA
    dc.b    0x49, 0x40, 0x11, 0x60, 0x0D, 0x53, 0x91, 0x87, 0x56, 0xC1, 0xF4, 0x41, 0x14, 0x74, 0x10, 0xCD
    dc.b    0x75, 0x5A, 0x28, 0x50, 0x01, 0x62, 0xE1, 0x42, 0x41, 0x65, 0x62, 0x59, 0x15, 0xFF, 0x62, 0x21
    dc.b    0x26, 0xC1, 0xBF, 0x36, 0xA6, 0x86, 0xD3, 0x54, 0x91, 0x5A, 0xA6, 0x0D, 0x15, 0x53, 0x81, 0xFD
    dc.b    0x60, 0x79, 0x10, 0xD3, 0xD8, 0x2E, 0x6F, 0x29, 0x14, 0x51, 0x24, 0xCC, 0x12, 0x76, 0x9F, 0x5A
    dc.b    0x8B, 0x25, 0x82, 0x29, 0x14, 0x42, 0xE2, 0x3E, 0x65, 0x6F, 0x44, 0x03, 0x84, 0x54, 0x9C, 0x0A
    dc.b    0x64, 0xAD, 0x81, 0xE5, 0x01, 0xC2, 0xF1, 0x36, 0xE2, 0x3C, 0xC3, 0xF9, 0x78, 0x4E, 0xA5, 0xD7
    dc.b    0x64, 0x20, 0xDC, 0xDC, 0x74, 0xAD, 0x40, 0x69, 0x81, 0xAB, 0x54, 0x57, 0x52, 0x28, 0x93, 0xF9
    dc.b    0x00, 0x52, 0x01, 0x14, 0x57, 0xF0, 0x41, 0xAD, 0x40, 0x6A, 0xB7, 0x35, 0x02, 0xCE, 0x29, 0xC5
    dc.b    0x02, 0x67, 0x56, 0x80, 0x0A, 0x0B, 0x46, 0xFF, 0x11, 0x10, 0xBC, 0x13, 0x68, 0x67, 0x80, 0xA0
    dc.b    0x7C, 0x81, 0x80, 0x30, 0x22, 0x7E, 0x26, 0x76, 0x42, 0xFC, 0x2A, 0x01, 0x37, 0x81, 0xB1, 0x6A
    dc.b    0xDA, 0xC1, 0x81, 0x31, 0x74, 0x48, 0x76, 0x4D, 0x53, 0x81, 0xFC, 0x13, 0x55, 0x57, 0xC1, 0x0F
    dc.b    0x80, 0x92, 0x5A, 0xD4, 0xFC, 0x51, 0xD6, 0x54, 0x98, 0xEA, 0xB0, 0x7C, 0x85, 0x40, 0xE2, 0x67
    dc.b    0x21, 0x41, 0x03, 0x63, 0x32, 0xFF, 0xB9, 0x42, 0xE0, 0x42, 0x1D, 0xA6, 0x14, 0x16, 0x20, 0x0B
    dc.b    0x04, 0x63, 0x15, 0x80, 0xC2, 0x01, 0x56, 0x59, 0xE9, 0xDA, 0x62, 0x11, 0x86, 0x80, 0x24, 0x08
    dc.b    0x96, 0xFB, 0x57, 0x21, 0x40, 0xD1, 0x15, 0x34, 0x77, 0x12, 0x4A, 0x67, 0x2B, 0xC5, 0x8A, 0x46
    dc.b    0x24, 0x74, 0x4E, 0x36, 0x09, 0x00, 0x01, 0xC5, 0x05, 0x72, 0x61, 0xA9, 0x42, 0x63, 0xD6, 0xE2
    dc.b    0x62, 0x46, 0x05, 0x4B, 0x30, 0x2B, 0xFC, 0x92, 0x3E, 0x59, 0x42, 0x97, 0x25, 0x02, 0x95, 0xC6
    dc.b    0xC4, 0x14, 0x8E, 0x65, 0xC4, 0x25, 0x76, 0xCC, 0xFF, 0x26, 0x52, 0x74, 0xC1, 0xAC, 0x03, 0xB1
    dc.b    0xA0, 0xD3, 0x42, 0xF2, 0x39, 0x41, 0xC1, 0x22, 0x41, 0xAC, 0x01, 0x2C, 0x55, 0x31, 0x58, 0x74
    dc.b    0xB9, 0x4F, 0x89, 0x11, 0x57, 0x15, 0x82, 0xC2, 0x36, 0x41, 0x45, 0xD5, 0xE8, 0xBF, 0x4B, 0x0E
    dc.b    0x1D, 0x21, 0x12, 0x47, 0x72, 0x10, 0x3C, 0xFD, 0xAE, 0x42, 0x7F, 0xA5, 0x20, 0x15, 0x02, 0x55
    dc.b    0x65, 0x24, 0x45, 0x67, 0x01, 0x57, 0x13, 0x11, 0x2B, 0x02, 0x62, 0x24, 0x76, 0x31, 0x46, 0xC4
    dc.b    0x14, 0x77, 0x65, 0x66, 0x40, 0xAA, 0x50, 0x6C, 0x53, 0x52, 0x10, 0x7F, 0xE4, 0xA0, 0x1A, 0x74
    dc.b    0x2D, 0x22, 0x34, 0x95, 0x98, 0xC2, 0x12, 0x56, 0xBC, 0x81, 0x4F, 0x02, 0x70, 0x0F, 0x25, 0x74
    dc.b    0x11, 0x4E, 0x01, 0x2B, 0x03, 0xC4, 0x25, 0x54, 0x9A, 0xA6, 0x4F, 0x12, 0xCA, 0x74, 0x13, 0x84
    dc.b    0x7F, 0xE2, 0x45, 0xEC, 0x02, 0x1C, 0x45, 0x43, 0x10, 0x67, 0x96, 0xBE, 0xB0, 0xD4, 0x52, 0x41
    dc.b    0x0F, 0x24, 0x02, 0xBE, 0xEA, 0x03, 0x55, 0x02, 0x01, 0x14, 0x56, 0x43, 0x42, 0xAC, 0x33, 0xAA
    dc.b    0xB2, 0x34, 0xE8, 0x92, 0x54, 0x33, 0xB6, 0xC9, 0x12, 0x01, 0x56, 0x01, 0x32, 0x9B, 0x13, 0x45
    dc.b    0x04, 0x5B, 0x38, 0xE8, 0x56, 0xCE, 0x0C, 0xC6, 0x11, 0x02, 0x22, 0x66, 0x44, 0xFC, 0x65, 0x18
    dc.b    0xCF, 0x02, 0x64, 0x39, 0xA7, 0x47, 0x63, 0x80, 0x2F, 0x26, 0x15, 0x9C, 0x68, 0x76, 0xA8, 0xEE
    dc.b    0x72, 0x44, 0x66, 0x56, 0x0E, 0x74, 0x70, 0x7A, 0x33, 0xF9, 0xB9, 0x87, 0xA4, 0x55, 0xFE, 0x27
    dc.b    0x9A, 0x9E, 0x65, 0x46, 0x72, 0x13, 0xF6, 0x41, 0x03, 0x05, 0xA2, 0xE9, 0x88, 0x28, 0x24, 0x44
    dc.b    0x86, 0xFD, 0x28, 0xDC, 0xD4, 0xCF, 0x2E, 0x64, 0x07, 0x57, 0x19, 0x12, 0x77, 0x54, 0x8E, 0x02
    dc.b    0x43, 0x46, 0xEB, 0x76, 0x9B, 0xB5, 0x50, 0x87, 0xFD, 0x44, 0x4D, 0x42, 0x0F, 0x94, 0xD0, 0x48
    dc.b    0x04, 0xAB, 0x32, 0x45, 0x7E, 0x64, 0xF0, 0x00, 0x25, 0x10, 0x13, 0x94, 0x10, 0x6E, 0x01, 0x89
    dc.b    0x55, 0x40, 0x2E, 0x76, 0xC8, 0xF1, 0x01, 0x0B, 0x86, 0x12, 0x35, 0xFF, 0x89, 0x6D, 0x01, 0xEB
    dc.b    0xCA, 0x63, 0x3E, 0x2F, 0x14, 0x65, 0xB4, 0x0D, 0x29, 0x12, 0x44, 0xCE, 0x59, 0x11, 0x93, 0x6A
    dc.b    0x66, 0x12, 0xF4, 0xD8, 0xB1, 0x47, 0x23, 0x75, 0x21, 0xC1, 0x14, 0x75, 0x46, 0x4A, 0x13, 0x41
    dc.b    0xE9, 0x30, 0x54, 0x31, 0x91, 0x7E, 0x5A, 0xD0, 0x2E, 0x90, 0xAD, 0x86, 0x57, 0x48, 0x36, 0x6F
    dc.b    0xA8, 0x25, 0x72, 0x64, 0x4C, 0x77, 0xA2, 0x29, 0x11, 0x7D, 0xA0, 0xE9, 0x9E, 0x2B, 0xF8, 0x12
    dc.b    0x34, 0x58, 0x67, 0x70, 0x14, 0x11, 0x15, 0x40, 0xD2, 0xC5, 0x13, 0x5F, 0xF0, 0xEE, 0x0D, 0xD0
    dc.b    0x52, 0x12, 0xA1, 0x9D, 0x54, 0x21, 0x4C, 0x55, 0x0F, 0x5E, 0x27, 0x92, 0x57, 0xDE, 0x16, 0x32
    dc.b    0x13, 0xA5, 0x52, 0x41, 0x14, 0x16, 0x59, 0x40, 0x30, 0x76, 0x56, 0x0F, 0x53, 0x22, 0x43, 0x21
    dc.b    0xD7, 0x8B, 0x1E, 0x34, 0x41, 0x08, 0x1D, 0xB5, 0x8D, 0x65, 0x44, 0x02, 0xDF, 0x24, 0x0D, 0x35
    dc.b    0xCE, 0xF3, 0x5E, 0xB8, 0x15, 0xF9, 0x3B, 0x25, 0x25, 0x30, 0xEC, 0x03, 0x67, 0x17, 0x52, 0x24
    dc.b    0x66, 0xD7, 0x4F, 0x0A, 0x7F, 0x65, 0x36, 0x50, 0xB0, 0xA4, 0x61, 0x78, 0x56, 0x76, 0x66, 0xCA
    dc.b    0x88, 0x87, 0x86, 0x17, 0x14, 0x78, 0x13, 0x24, 0x90, 0xB8, 0x32, 0x32, 0x46, 0xA7, 0x26, 0xCE
    dc.b    0x75, 0x50, 0x15, 0xCC, 0x02, 0xA2, 0xD0, 0x41, 0xC4, 0x52, 0x38, 0xE3, 0xA4, 0x5D, 0x70, 0x13
    dc.b    0x11, 0x1A, 0x52, 0x03, 0x28, 0x97, 0x40, 0xD1, 0x01, 0x64, 0xED, 0x10, 0x94, 0x67, 0x23, 0x40
    dc.b    0x2F, 0x09, 0x0C, 0x05, 0x04, 0x67, 0x02, 0xC1, 0x24, 0x65, 0x20, 0x31, 0x02, 0x72, 0x1E, 0x89
    dc.b    0x01, 0x2E, 0x00, 0x97, 0x2B, 0xF0, 0x2F, 0x13, 0x2E, 0xFC, 0xB6, 0x4A, 0xE9, 0x15, 0x17, 0xA4
    dc.b    0xC8, 0x26, 0xFD, 0xA2, 0x83, 0xD3, 0x91, 0x73, 0xFC, 0x13, 0x5D, 0x92, 0x30, 0xBD, 0xFA, 0xFA
    dc.b    0x69, 0x4A, 0x13, 0x05, 0x6F, 0x12, 0x65, 0x88, 0x80, 0x23, 0x4D, 0x57, 0x7F, 0x2A, 0x35, 0xA2
    dc.b    0xB4, 0xC1, 0x2D, 0x34, 0x09, 0xB4, 0x1A, 0x54, 0xA5, 0xDD, 0x20, 0x0E, 0xCD, 0x8A, 0x20, 0x63
    dc.b    0x43, 0x5B, 0x43, 0x96, 0x7E, 0x7B, 0x74, 0xB1, 0xF7, 0x94, 0x12, 0x93, 0x43, 0x40, 0xE4, 0x68
    dc.b    0x80, 0x01, 0x58, 0x26, 0x6F, 0x8A, 0x46, 0x45, 0xA4, 0xC3, 0x39, 0x4D, 0xC6, 0x3D, 0x51, 0xE9
    dc.b    0x94, 0x43, 0x3D, 0xF2, 0x66, 0xB8, 0xB7, 0x24, 0x63, 0xAD, 0x40, 0xC9, 0x2A, 0x5D, 0x15, 0x13
    dc.b    0x24, 0x36, 0xE0, 0x6E, 0x38, 0x77, 0x55, 0xE9, 0x08, 0x52, 0x3C, 0x65, 0x52, 0x28, 0x47, 0x66
    dc.b    0x37, 0x1A, 0xE1, 0x5E, 0xC0, 0x97, 0x84, 0x3E, 0xA8, 0xF0, 0x2B, 0x31, 0xCB, 0x2C, 0xB6, 0x27
    dc.b    0x10, 0x73, 0x15, 0x65, 0x4C, 0x33, 0x93, 0x2F, 0x41, 0x1C, 0xC9, 0x8D, 0x40, 0x6D, 0xDA, 0x60
    dc.b    0x27, 0x76, 0x42, 0x52, 0x52, 0xC2, 0x78, 0x31, 0x14, 0x65, 0x17, 0x02, 0x47, 0xA0, 0x28, 0x48
    dc.b    0xB9, 0x44, 0xEA, 0x32, 0xFA, 0x1E, 0x81, 0x2D, 0x46, 0x66, 0x1B, 0xE5, 0xA9, 0x37, 0x63, 0x94
    dc.b    0xBB, 0x75, 0x0C, 0x0B, 0x23, 0x55, 0x66, 0x4E, 0x56, 0x58, 0x14, 0x6E, 0xA9, 0x39, 0x95, 0xF4
    dc.b    0x82, 0x9B, 0x32, 0x91, 0x3F, 0x24, 0x69, 0xAF, 0x2D, 0x14, 0x92, 0xB0, 0x5C, 0x49, 0x3F, 0xD8
    dc.b    0xFD, 0xB2, 0x20, 0xBC, 0x40, 0xA5, 0x11, 0x45, 0x01, 0x47, 0x05, 0x34, 0x66, 0x1C, 0x78, 0x11
    dc.b    0x58, 0x26, 0x60, 0x12, 0x53, 0x10, 0x8F, 0xF3, 0x52, 0xBF, 0xB5, 0x12, 0x5A, 0xCB, 0xD3, 0xD7
    dc.b    0xC1, 0x2C, 0x65, 0x43, 0xD3, 0x9C, 0xD6, 0x00, 0x8E, 0x49, 0x32, 0x2E, 0xB9, 0x4E, 0x51, 0xDA
    dc.b    0x03, 0xC9, 0x03, 0x75, 0x02, 0x02, 0x50, 0x3D, 0x9A, 0x4D, 0x24, 0x74, 0x21, 0x2E, 0xDC, 0xD3
    dc.b    0x03, 0xCA, 0xF1, 0xCB, 0x01, 0x92, 0xFF, 0x89, 0xF0, 0x91, 0xAB, 0x53, 0x61, 0x61, 0x42, 0xD2
    dc.b    0x52, 0x4D, 0x2E, 0xC8, 0x80, 0x74, 0x90, 0xF5, 0x9C, 0x27, 0x13, 0x47, 0xA1, 0x43, 0x05, 0x85
    dc.b    0xD6, 0x7C, 0x8C, 0x91, 0x61, 0xE9, 0x71, 0x48, 0x70, 0x36, 0x42, 0x96, 0xBD, 0x54, 0x81, 0xB7
    dc.b    0x31, 0x31, 0x39, 0xA4, 0x06, 0x48, 0x2C, 0xFB, 0x67, 0x15, 0xB5, 0x10, 0x7A, 0xEE, 0x34, 0x24
    dc.b    0xBE, 0xA7, 0x7A, 0x96, 0x16, 0x6F, 0x44, 0x34, 0x57, 0x54, 0x82, 0x3C, 0x53, 0xA9, 0x7B, 0x8F
    dc.b    0xD3, 0xD2, 0x7A, 0x6E, 0x4E, 0x78, 0xF0, 0x12, 0x0B, 0x56, 0x74, 0x32, 0x23, 0x8D, 0x05, 0x52
    dc.b    0x06, 0x85, 0x0C, 0x9A, 0x36, 0x93, 0x73, 0xC9, 0x17, 0x7F, 0x34, 0xBE, 0x8A, 0xC0, 0x92, 0x18
    dc.b    0x32, 0x0A, 0x74, 0x11, 0x50, 0x47, 0x7E, 0x12, 0xD1, 0x5E, 0xF4, 0xB4, 0xE0, 0x4C, 0x31, 0xAF
    dc.b    0x40, 0x8B, 0x64, 0x20, 0x6D, 0xE9, 0x17, 0x53, 0x32, 0x01, 0x43, 0x50, 0xC4, 0x98, 0x38, 0x51
    dc.b    0x21, 0x3B, 0x65, 0x00, 0x0A, 0x1E, 0x4B, 0x8A, 0x5B, 0x96, 0x24, 0xD1, 0xDB, 0x80, 0x4F, 0x32
    dc.b    0x6B, 0x76, 0x6A, 0xB9, 0xC0, 0x34, 0x41, 0x26, 0xA4, 0xDD, 0x23, 0x36, 0x73, 0x8A, 0x01, 0x15
    dc.b    0xD3, 0x34, 0x0F, 0x9E, 0xC1, 0x86, 0x03, 0x67, 0x70, 0xC4, 0x02, 0x11, 0x36, 0xD7, 0x00, 0x8A
    dc.b    0xB9, 0x92, 0x24, 0x53, 0x7C, 0x57, 0xFC, 0x29, 0x7C, 0x35, 0x87, 0xFF, 0x58, 0x02, 0x0F, 0x2D
    dc.b    0x10, 0x16, 0x4A, 0xAD, 0xE0, 0xB0, 0x9D, 0x55, 0x43, 0x32, 0x13, 0x33, 0x22, 0x35, 0x88, 0x76
    dc.b    0x26, 0x48, 0x74, 0x8D, 0x48, 0x87, 0x50, 0x4E, 0x53, 0x91, 0xFE, 0xCC, 0x56, 0x13, 0x1C, 0x43
    dc.b    0x33, 0x44, 0xBA, 0x73, 0xC9, 0x02, 0x42, 0x16, 0xC1, 0x87, 0xD4, 0xA7, 0x62, 0xAC, 0x70, 0x6A
    dc.b    0x34, 0x56, 0x57, 0xF1, 0x41, 0xAF, 0x76, 0x44, 0x77, 0x54, 0x2C, 0x29, 0x24, 0x31, 0xFE, 0x72
    dc.b    0x0E, 0xD5, 0x8A, 0x66, 0x01, 0x49, 0x07, 0x64, 0x21, 0xD9, 0x17, 0x01, 0xA4, 0xFC, 0x8B, 0x44
    dc.b    0x45, 0x04, 0x38, 0x74, 0xF0, 0x31, 0x23, 0xF5, 0x3D, 0x81, 0x73, 0xE9, 0x2F, 0x28, 0xB7, 0x01
    dc.b    0x05, 0x57, 0x52, 0x34, 0x45, 0x65, 0x26, 0x80, 0xFF, 0xF3, 0xA5, 0xB6, 0xA9, 0x03, 0xF0, 0x26
    dc.b    0x93, 0x94, 0xE9, 0x48, 0x19, 0x36, 0x75, 0xA0, 0xA2, 0x46, 0x56, 0x9F, 0x0E, 0xC2, 0x74, 0x80
    dc.b    0x5F, 0x2D, 0xF5, 0x38, 0xBA, 0x6A, 0xF0, 0x20, 0x12, 0x11, 0x34, 0x00, 0xBC, 0x10, 0x4B, 0x0D
    dc.b    0x03, 0x34, 0xDC, 0xE0, 0x67, 0x64, 0xBE, 0x70, 0x56, 0x84, 0xA6, 0x51, 0x55, 0x88, 0x43, 0x0C
    dc.b    0x22, 0x8C, 0xE2, 0xEC, 0xCD, 0x36, 0xA0, 0x93, 0x24, 0x20, 0xCE, 0x26, 0x7F, 0xDD, 0x4D, 0x3A
    dc.b    0xF7, 0xBE, 0x73, 0x56, 0x32, 0x01, 0x13, 0xAE, 0x33, 0x7A, 0xC0, 0xB4, 0x2D, 0xD0, 0x14, 0x45
    dc.b    0x27, 0x43, 0x11, 0xB4, 0x7A, 0x86, 0x01, 0x70, 0x32, 0x85, 0x68, 0xC5, 0x94, 0x10, 0x15, 0xB9
    dc.b    0x1E, 0x10, 0x55, 0xCD, 0x04, 0x2A, 0x2A, 0x01, 0xEE, 0x5A, 0xCF, 0x7D, 0xF5, 0x53, 0x40, 0x8F
    dc.b    0x51, 0x77, 0xB7, 0x1F, 0x7C, 0x65, 0x01, 0x84, 0x2C, 0x85, 0x92, 0xA8, 0xA6, 0x92, 0x17, 0x9B
    dc.b    0x12, 0xF4, 0xC2, 0x6F, 0x55, 0x9D, 0x40, 0xEB, 0x52, 0xDC, 0x98, 0x73, 0x82, 0x40, 0x43, 0xAF
    dc.b    0x6D, 0x04, 0x15, 0x10, 0x0E, 0x40, 0xE3, 0x12, 0x26, 0x64, 0x23, 0xA3, 0x12, 0x45, 0xB4, 0x1F
    dc.b    0x66, 0x9A, 0x70, 0xF6, 0x42, 0xD0, 0x11, 0x40, 0xA8, 0x13, 0x46, 0x21, 0xA1, 0x24, 0x42, 0xA6
    dc.b    0x7A, 0xD5, 0x0A, 0x14, 0x51, 0x40, 0x24, 0xDA, 0x45, 0x11, 0x2F, 0x40, 0x10, 0x15, 0x51, 0xFC
    dc.b    0x02, 0x13, 0x54, 0x21, 0x35, 0xE1, 0x53, 0xDD, 0x63, 0xC2, 0xBA, 0x38, 0x17, 0x40, 0x08, 0x16
    dc.b    0x61, 0x7E, 0x39, 0x13, 0x52, 0x5E, 0x4B, 0x0B, 0x01, 0x88, 0x83, 0x40, 0xD3, 0xEA, 0x11, 0x71
    dc.b    0x76, 0xB6, 0x37, 0x07, 0x17, 0x21, 0x26, 0x72, 0x24, 0x2C, 0x9D, 0xFE, 0x05, 0x1B, 0xF1, 0x4D
    dc.b    0xDA, 0x83, 0x09, 0x15, 0x61, 0x92, 0x52, 0x0F, 0x7F, 0xD4, 0x55, 0x40, 0x2C, 0x11, 0x0B, 0x6F
    dc.b    0x8C, 0x65, 0x09, 0x34, 0xB5, 0x23, 0xAF, 0x13, 0x31, 0x91, 0x53, 0x21, 0xEA, 0x82, 0x9E, 0x03
    dc.b    0x55, 0xC3, 0xA9, 0x9A, 0x30, 0xCB, 0xD4, 0xF4, 0xEC, 0xC4, 0xD4, 0xAF, 0x75, 0x58, 0x33, 0xBD
    dc.b    0x3C, 0x32, 0x98, 0x45, 0x31, 0x81, 0x14, 0x63, 0xFC, 0x24, 0x29, 0x20, 0x02, 0x80, 0x92, 0x32
    dc.b    0x4A, 0xC1, 0x30, 0x80, 0x63, 0x14, 0x55, 0xEE, 0x63, 0x1F, 0x16, 0x52, 0x35, 0x18, 0x44, 0x14
    dc.b    0x31, 0x02, 0xB2, 0xE9, 0xF0, 0x21, 0x32, 0x01, 0x45, 0x16, 0x53, 0xA6, 0xB2, 0x56, 0x02, 0x67
    dc.b    0x51, 0xC8, 0x23, 0x74, 0x64, 0x84, 0xB9, 0xC0, 0xF8, 0x14, 0x52, 0x02, 0xFF, 0x98, 0x57, 0x13
    dc.b    0x33, 0x01, 0x67, 0xF1, 0x94, 0x17, 0x20, 0x40, 0x7B, 0x09, 0x35, 0x42, 0x12, 0x36, 0x00, 0x33
    dc.b    0x26, 0x64, 0x43, 0x37, 0x34, 0x75, 0x32, 0x12, 0x10, 0xC3, 0xC0, 0x41, 0xBB, 0x12, 0xE9, 0x24
    dc.b    0x8F, 0x9B, 0x8A, 0x25, 0x93, 0x3B, 0xBF, 0x61, 0x2E, 0x67, 0x1E, 0x1E, 0x77, 0x58, 0x23, 0x1E
    dc.b    0x03, 0x62, 0xE7, 0xD8, 0x55, 0x32, 0xFE, 0x25, 0x50, 0x51, 0x40, 0x42, 0x53, 0x21, 0xC0, 0x6A
    dc.b    0x80, 0x56, 0x2E, 0x27, 0x20, 0x9D, 0x3A, 0x16, 0x76, 0x73, 0xC4, 0x40, 0x26, 0x61, 0x98, 0x40
    dc.b    0x25, 0x25, 0x41, 0x11, 0xE3, 0xDC, 0x2A, 0xDE, 0x21, 0xB5, 0xD0, 0x58, 0xB6, 0x3C, 0x66, 0xFC
    dc.b    0xDA, 0xD5, 0xAA, 0xA4, 0x2B, 0x12, 0xD9, 0x00, 0xE6, 0x45, 0x40, 0x20, 0x8F, 0x83, 0xDF, 0x67
    dc.b    0x86, 0x6C, 0x73, 0xAD, 0x73, 0xDA, 0x92, 0x40, 0x0A, 0x94, 0x0E, 0x25, 0x8D, 0x7D, 0x36, 0xBF
    dc.b    0x31, 0x4F, 0x96, 0x4E, 0x7A, 0x86, 0xAA, 0x82, 0x8F, 0x43, 0x35, 0x7C, 0x0A, 0x93, 0xC0, 0x6D
    dc.b    0xD0, 0xB6, 0x7E, 0xA5, 0x7A, 0x86, 0x03, 0xD8, 0xE5, 0x2E, 0x46, 0x33, 0x5A, 0x55, 0x1E, 0x4C
    dc.b    0xAA, 0x0E, 0x86, 0x3D, 0xC3, 0x65, 0x13, 0x55, 0x65, 0x34, 0x02, 0x54, 0xF4, 0x3C, 0x40, 0x15
    dc.b    0xB7, 0x99, 0x3F, 0x16, 0x44, 0xD6, 0x3C, 0x80, 0x57, 0x68, 0x65, 0x7E, 0xCA, 0xC6, 0x14, 0x80
    dc.b    0xF9, 0x0A, 0x5C, 0xEF, 0x48, 0x40, 0x41, 0x2D, 0x22, 0xF8, 0xD8, 0x11, 0x15, 0x74, 0x45, 0x21
    dc.b    0x94, 0xD0, 0x41, 0x40, 0xE3, 0x56, 0x75, 0x7F, 0xA6, 0x80, 0x90, 0x35, 0x82, 0xF7, 0x3A, 0x40
    dc.b    0x54, 0x16, 0xC8, 0xC0, 0xFA, 0x49, 0x1D, 0x23, 0x20, 0x32, 0x31, 0xA7, 0x40, 0x27, 0xA3, 0x28
    dc.b    0x12, 0x21, 0x55, 0x78, 0xDE, 0x42, 0xB5, 0x54, 0x89, 0x27, 0x3C, 0xAA, 0x85, 0x40, 0x92, 0x02
    dc.b    0x49, 0x93, 0x23, 0x0C, 0x14, 0x81, 0x15, 0x82, 0x32, 0xF2, 0xA2, 0x80, 0x53, 0x12, 0x41, 0x68
    dc.b    0x30, 0xD0, 0x54, 0x22, 0x90, 0xDB, 0x49, 0x62, 0xA1, 0x45, 0xA7, 0x37, 0xAA, 0x93, 0x29, 0xF8
    dc.b    0xA8, 0x11, 0xE5, 0xA3, 0x16, 0xF5, 0x13, 0xBD, 0x10, 0x36, 0x03, 0xD1, 0x04, 0x26, 0x12, 0x38
    dc.b    0x1A, 0x55, 0x6F, 0x43, 0x53, 0xB7, 0x99, 0x0D, 0xBD, 0x13, 0xAC, 0x4E, 0x2A, 0xFA, 0xCE, 0x78
    dc.b    0xB1, 0x80, 0x28, 0x15, 0xA4, 0x2D, 0x98, 0xB6, 0x86, 0x03, 0xCB, 0x20, 0x30, 0x99, 0x2A, 0x63
    dc.b    0x44, 0x0B, 0x81, 0xC6, 0x22, 0x33, 0xB5, 0x49, 0x07, 0x9F, 0xAA, 0x46, 0x8D, 0xD2, 0x51, 0x49
    dc.b    0x1C, 0xE4, 0xA6, 0x3E, 0x6D, 0x34, 0x1B, 0x29, 0x32, 0xBA, 0xB6, 0x00

    .align  2
    .global logo_lib
logo_lib:
    dc.w    1
    dc.w    128, 128
    dc.l    logo_lib_palette
    dc.l    logo_lib_image

    .align  2
font_lib_tiles:
    dc.b    0x00, 0xA5, 0x01, 0x70, 0x0F, 0xF0, 0xAD, 0x04, 0x34, 0x28, 0x29, 0x08, 0x14, 0x0B, 0x29, 0x02
    dc.b    0x0E, 0x3F, 0x99, 0x04, 0xFF, 0xA3, 0x03, 0x24, 0x23, 0x0C, 0x23, 0x48, 0xB4, 0x1E, 0x26, 0x0E
    dc.b    0x10, 0x84, 0x2E, 0xD0, 0x10, 0x60, 0xAD, 0x0D, 0x14, 0xDE, 0x9A, 0x10, 0x33, 0x21, 0xEE, 0x23
    dc.b    0xD0, 0x9D, 0x08, 0x9B, 0x0F, 0xD5, 0x36, 0x5C, 0x18, 0xFD, 0x4E, 0xC0, 0xD0, 0x01, 0xBD, 0x07
    dc.b    0x39, 0x4A, 0x28, 0x5B, 0xE5, 0x24, 0x14, 0x50, 0x3F, 0x0F, 0xB4, 0x64, 0x20, 0x34, 0x2F, 0x69
    dc.b    0xA0, 0x09, 0xBC, 0xA2, 0x06, 0x05, 0xE1, 0x22, 0x08, 0xB4, 0x34, 0x38, 0x5E, 0xD8, 0x6B, 0x88
    dc.b    0xF2, 0x3E, 0xB0, 0x56, 0xFF, 0x17, 0xDA, 0x81, 0x9F, 0xB0, 0x68, 0x11, 0x79, 0xFF, 0x4F, 0x07
    dc.b    0x7B, 0xAD, 0xFF, 0xB8, 0xC8, 0x64, 0xA5, 0x5A, 0x7C, 0x0C, 0x14, 0xD0, 0x8D, 0x3F, 0x24, 0x04
    dc.b    0xF2, 0x36, 0x8C, 0x85, 0xF4, 0xA1, 0x64, 0x6D, 0x41, 0x1E, 0xB8, 0x52, 0xD4, 0x9A, 0x58, 0x3E
    dc.b    0x60, 0xD5, 0x62, 0xC8, 0xD0, 0x1C, 0x7C, 0xA5, 0x30, 0x21, 0x40, 0x6A, 0x97, 0xC8, 0x14, 0x21
    dc.b    0xA0, 0x7B, 0x46, 0x71, 0x20, 0x78, 0xF1, 0x0B, 0x90, 0x50, 0x52, 0x04, 0xA6, 0x08, 0xA5, 0x00
    dc.b    0xCE, 0x14, 0x40, 0xED, 0x0B, 0x20, 0x42, 0x48, 0x9A, 0x16, 0xB7, 0x74, 0x29, 0xE4, 0xD2, 0x17
    dc.b    0x20, 0x12, 0xFF, 0x2E, 0x9C, 0x52, 0x24, 0x91, 0x41, 0xE5, 0x2E, 0x50, 0x68, 0x03, 0x2F, 0xFA
    dc.b    0xBC, 0xE4, 0xAD, 0xA0, 0x69, 0xBE, 0xC0, 0x93, 0x00, 0x6F, 0x16, 0x2D, 0x8C, 0xFA, 0x6F, 0x00
    dc.b    0x29, 0x1C, 0xC8, 0x80, 0xA6, 0xEC, 0xDA, 0x96, 0x78, 0x8D, 0x24, 0x21, 0x60, 0x5A, 0x14, 0xFB
    dc.b    0xA5, 0xA0, 0x49, 0x92, 0xB8, 0x16, 0x3C, 0x91, 0x04, 0xBE, 0xCC, 0x00, 0xED, 0x33, 0xA3, 0x9A
    dc.b    0x28, 0x37, 0x20, 0xAB, 0x00, 0xC8, 0x7C, 0x5B, 0x53, 0x18, 0xCC, 0x96, 0x7D, 0xC0, 0xAC, 0x29
    dc.b    0xCC, 0x74, 0x9B, 0xB8, 0x69, 0x9D, 0x00, 0x23, 0x1D, 0x68, 0xE0, 0x56, 0x87, 0xD4, 0xA3, 0xEC
    dc.b    0x4B, 0x9F, 0x5F, 0xA1, 0xE0, 0x5B, 0x74, 0x9D, 0xAA, 0x02, 0xC4, 0xDC, 0xD1, 0x7A, 0x10, 0x68
    dc.b    0x09, 0x60, 0x7B, 0xF5, 0x74, 0xC0, 0x35, 0xC4, 0x79, 0xA0, 0x5B, 0xBC, 0x4C, 0x20, 0xF9, 0x5B
    dc.b    0xB8, 0x69, 0x0C, 0x1F, 0x40, 0x2B, 0xA0, 0x48, 0x82, 0x48, 0x40, 0xD4, 0xD0, 0x08, 0x80, 0xB9
    dc.b    0x72, 0xE0, 0xDA, 0x08, 0x65, 0xA0, 0xED, 0x26, 0x28, 0x68, 0xED, 0x14, 0x32, 0x2B, 0x02, 0x68
    dc.b    0x69, 0x20, 0x7C, 0xE1, 0x2C, 0x40, 0xA9, 0xC2, 0x4E, 0x34, 0xF3, 0x26, 0x44, 0x6A, 0x04, 0x40
    dc.b    0x5C, 0x8C, 0x38, 0xD2, 0x09, 0x2B, 0x00, 0x47, 0x58, 0x90, 0xA0, 0xA9, 0xAE, 0x30, 0x60, 0x56
    dc.b    0xD2, 0x29, 0x7D, 0xE1, 0x4A, 0xE1, 0x90, 0x60, 0xA4, 0xCE, 0xC8, 0x9A, 0xC3, 0x1C, 0x3F, 0x91
    dc.b    0x80, 0x72, 0xB4, 0xA1, 0xF9, 0x38, 0x08, 0xA4, 0x24, 0xD8, 0xA2, 0x23, 0xBD, 0x29, 0xAC, 0x4C
    dc.b    0xE0, 0xAD, 0x27, 0x40, 0x6B, 0x19, 0x17, 0xC0, 0x29, 0xBC, 0x4F, 0x16, 0x3A, 0x40, 0x46, 0xF4
    dc.b    0x59, 0x00, 0xAD, 0x73, 0xA4, 0xDA, 0x08, 0x47, 0x0C, 0xA3, 0x42, 0x6D, 0x28, 0x5A, 0xC4, 0x69
    dc.b    0x08, 0x45, 0xA4, 0xED, 0x31, 0x0A, 0x40, 0x9A, 0x28, 0x73, 0x48, 0xA5, 0xB5, 0xEC, 0x23, 0x5C
    dc.b    0xE8, 0xA4, 0x72, 0x1D, 0xC0, 0xBC, 0x4D, 0x41, 0xE6, 0xCE, 0x9C, 0x04, 0xFB, 0x47, 0x79, 0x21
    dc.b    0xD5, 0xA5, 0xF4, 0x79, 0x60, 0xE1, 0xFF, 0x73, 0x00, 0xB7, 0x09, 0x17, 0xE0, 0xB4, 0xC1, 0xF2
    dc.b    0x44, 0xA7, 0x48, 0x4B, 0x1E, 0x04, 0xD3, 0x2F, 0x3E, 0xC4, 0x4F, 0x2F, 0x8C, 0x6B, 0x41, 0x35
    dc.b    0x00, 0x2C, 0x04, 0x5F, 0xA9, 0x40, 0x5B, 0x58, 0x08, 0x04, 0xE9, 0x3C, 0x6B, 0xF9, 0x3C, 0xE4
    dc.b    0xBD, 0x4F, 0x3F, 0x58, 0x04, 0xAD, 0x2C, 0x61, 0xD6, 0x6B, 0x04, 0x68, 0x3E, 0x20, 0xD4, 0x91
    dc.b    0xC0, 0xD2, 0xCD, 0x00, 0x22, 0x3C, 0xD1, 0x14, 0x40, 0xF6, 0x71, 0x94, 0xEC, 0xD2, 0x35, 0x60
    dc.b    0xB4, 0x39, 0xA2, 0xA4, 0xB4, 0xF3, 0x00, 0xF4, 0xCA, 0x60, 0xD5, 0xE0, 0xA6, 0x18, 0x8F, 0x04
    dc.b    0x49, 0x4E, 0xE0, 0xE9, 0xF2, 0x3A, 0xEA, 0xDC, 0xB4, 0x62, 0xB4, 0x94, 0x7A, 0x79, 0xA8, 0xCD
    dc.b    0x30, 0x67, 0x5D, 0x96, 0x89, 0xE0, 0x68, 0xE8, 0xF4, 0x26, 0x1F, 0x00

    .align  2
    .global font_lib
font_lib:
    dc.w    1
    dc.w    96
    dc.l    font_lib_tiles

    .align  2
font_pal_lib_pal:
    dc.w    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
    dc.w    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0EEE

    .align  2
    .global font_pal_lib
font_pal_lib:
    dc.w    0, 16
    dc.l    font_pal_lib_pal
EOF

cat > src/Makefile <<EOF
TOOLS = \$(HOME)/x-tools/m68k-megadrive-elf/bin/m68k-megadrive-elf
OPTS := -O1 -fomit-frame-pointer
CC_FLAGS := -m68000 -Wall \$(OPTS) -fno-builtin-memset -fno-builtin-memcpy -I ../inc -I . -I ../res -c
CC_SRCS := \$(wildcard *.c)
CC_OBJS := \$(CC_SRCS:%.c=%.o)
AS_SRCS := \$(wildcard *.s)
AS_OBJS := \$(AS_SRCS:%.s=%.o)

all: libmd.a

libmd.a: \$(CC_OBJS) \$(AS_OBJS)
	\$(TOOLS)-ar rs libmd.a \$(CC_OBJS) \$(AS_OBJS)

%.o: %.s
	\$(TOOLS)-gcc \$(CC_FLAGS) -o \$@ \$<

%.o: %.c
	\$(TOOLS)-gcc \$(CC_FLAGS) -o \$@ $<

clean: FORCE
	rm -f *.a *.o *.elf *.bin *.lst

FORCE:
EOF

rm src/z80_ctrl.c
patch src/sys.c <<EOF
--- src/sys.old	2014-04-21 17:53:39.478029381 +0100
+++ src/sys.new	2014-04-21 17:53:26.437998115 +0100
@@ -582 +582 @@
-    Z80_init();
+    //Z80_init();
EOF

echo Building...
make -C src
