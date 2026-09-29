public struct TemperatureConverter {
    
    public init() {}
    
    public static func celsius(from kelvin: Double?) -> Double? {
        guard let kelvin = kelvin else {
            return nil
        }
        
        // Valid greenhouse sensor range:
        // 0 K to 1000 K
        guard kelvin >= 0 && kelvin <= 1000 else {
            return nil
        }
        
        return kelvin - 273.15
    }
    
    public static func fahrenheit(from kelvin: Double?) -> Double? {
        guard let kelvin = kelvin else {
            return nil
        }
        
        guard kelvin >= 0 && kelvin <= 1000 else {
            return nil
        }
        
        return (kelvin - 273.15) * 9 / 5 + 32
    }
}
