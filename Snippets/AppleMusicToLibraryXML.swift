import Foundation

#if os(macOS)

import MusicLibrary

let args = CommandLine.arguments
if args.count <= 1 {
    print("Usage: \(args[0]) <path to output library xml>")
    exit(1)
}

let importer = try LocalAppleMusicImporter()
let exporter = LibraryXMLExporter(filePath: args[1])

let library = try importer.readLibrary()
try exporter.write(library: library)

#else

fatalError("Converting the Apple Music library is only supported on macOS")

#endif
