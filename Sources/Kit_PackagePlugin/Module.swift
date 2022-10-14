//
//

@_exported import Kit_Shared

#if canImport(PackagePlugin)

import Foundation
import PackagePlugin

extension PackagePlugin.Command {

    public static func zsh(_ name: String, @Builder<CustomStringConvertible> arguments: () -> [CustomStringConvertible] = {}, outputDirectory: Path) {
        .pre
    }

    public static func prebuild(_ name: String, tool: PluginContext.Tool, arguments: [CustomStringConvertible] = [], outputDirectory: Path) -> Self {
        .prebuildCommand(displayName: name, executable: tool.path, arguments: arguments, outputFilesDirectory: outputDirectory)
    }
}


#endif
