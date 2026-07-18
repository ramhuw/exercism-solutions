// TODO: define the 'LogLevel' enum, its `init`, and its `shortFormat` method
enum LogLevel {
    case trace, debug, info, warning, error, fatal, unknown

    init(_ level: String) {
        if level.starts(with: "[TRC]") {
            self = .trace
        } else if level.starts(with: "[DBG]") {
            self = .debug
        } else if level.starts(with: "[INF]") {
            self = .info
        } else if level.starts(with: "[WRN]") {
            self = .warning
        } else if level.starts(with: "[ERR]") {
            self = .error
        } else if level.starts(with: "[FTL]") {
            self = .fatal
        } else {
            self = .unknown
        }
    }
    func shortFormat(message: String) -> String {
            let n = switch self {
            case .trace: 0
            case .debug: 1
            case .info: 4
            case .warning : 5
            case .error: 6
            case .fatal : 7
            case .unknown: 42
            }
            return "\(n):\(message)"
        }
}