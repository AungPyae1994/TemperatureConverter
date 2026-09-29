public struct TemperatureConverter {
    
    public init() {}
    
    public static func celsius(from kelvin: Double?) -> Double? {
        guard let kelvin = kelvin, kelvin >= 0 else {
            return nil
        }
        
        return kelvin - 273.15
    }
    
    public static func fahrenheit(from kelvin: Double?) -> Double? {
        guard let kelvin = kelvin, kelvin >= 0 else {
            return nil
        }
        
        return (kelvin - 273.15) * 9 / 5 + 32
    }
}
