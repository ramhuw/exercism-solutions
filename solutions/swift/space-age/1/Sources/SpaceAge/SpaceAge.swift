class SpaceAge {
  let sec: Int
  var onEarth: Double
    {
      get {
      Double(sec) / 60.0 / 60.0 / 24.0 / 365.25
      }
    }
  var onMercury: Double {
    get {
      onEarth / 0.2408467
    }
  } 
  var onVenus: Double {
    get {
      onEarth / 0.61519726
    }
  }
  var onMars: Double {
    get {
      onEarth / 1.8808158
    }
  }
  var onJupiter: Double {
    get {
      onEarth / 11.862615
    }
  }
  var onSaturn: Double {
    get {
      onEarth / 29.447498
    }
  }
  var onUranus: Double {
    get {
      onEarth / 84.016846
    }
  }
  var onNeptune: Double {
    get {
      onEarth / 164.79132
    }
  }
  init(_ sec: Int) {
    self.sec = sec
  }
}
