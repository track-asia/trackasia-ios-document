import Foundation
import TrackAsia

extension UIColor {
    class var defaultRouteLine: UIColor { ConfigManager.shared.config.routeLineColor }
    class var defaultRouteLineAlternative: UIColor { ConfigManager.shared.config.routeLineAlternativeColor }
    
    class var defaultRouteLineCasing: UIColor { ConfigManager.shared.config.routeLineCasingColor }
    class var defaultRouteLineCasingAlternative: UIColor { ConfigManager.shared.config.routeLineCasingAlternativeColor }
    
    class var defaultRouteLayer: UIColor { #colorLiteral(red: 0.337254902, green: 0.6588235294, blue: 0.9843137255, alpha: 1) }
    class var defaultManeuverArrowStroke: UIColor { ConfigManager.shared.config.routeArrowCasingColor }
    class var defaultManeuverArrow: UIColor { ConfigManager.shared.config.routeArrowColor }
    
    class var defaultTurnArrowPrimary: UIColor { #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) }
    class var defaultTurnArrowSecondary: UIColor { #colorLiteral(red: 0.6196078431, green: 0.6196078431, blue: 0.6196078431, alpha: 1) }
    
    class var defaultLaneArrowPrimary: UIColor { #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) }
    class var defaultLaneArrowSecondary: UIColor { #colorLiteral(red: 0.6196078431, green: 0.6196078431, blue: 0.6196078431, alpha: 1) }
    
    class var trafficUnknown: UIColor { defaultRouteLayer }
    class var trafficLow: UIColor { defaultRouteLayer }
    class var trafficModerate: UIColor { #colorLiteral(red: 0.9529411765, green: 0.6509803922, blue: 0.3098039216, alpha: 1) }
    class var trafficHeavy: UIColor { #colorLiteral(red: 0.9137254902, green: 0.2, blue: 0.2509803922, alpha: 1) }
    class var trafficSevere: UIColor { #colorLiteral(red: 0.5411764706, green: 0.05882352941, blue: 0.2196078431, alpha: 1) }
    class var trafficAlternateLow: UIColor { #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) }
}

private extension UIColor {
    // General styling
    class var defaultTint: UIColor { #colorLiteral(red: 0.1843137255, green: 0.4784313725, blue: 0.7764705882, alpha: 1) }
    class var defaultTintStroke: UIColor { #colorLiteral(red: 0.1843137255, green: 0.4784313725, blue: 0.7764705882, alpha: 1) }
    class var defaultPrimaryText: UIColor { #colorLiteral(red: 45.0 / 255.0, green: 45.0 / 255.0, blue: 45.0 / 255.0, alpha: 1) }
    class var defaultSecondaryText: UIColor { #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1) }
}

private extension UIFont {
    // General styling
    class var defaultPrimaryText: UIFont { UIFont.systemFont(ofSize: 26) }
    class var defaultSecondaryText: UIFont { UIFont.systemFont(ofSize: 16) }
}

/**
 `DefaultStyle` is default style for Mapbox Navigation SDK.
 */
@objc(MBDayStyle)
open class DayStyle: Style {
    @objc public required init(mapStyleURL: URL) {
        super.init(mapStyleURL: mapStyleURL)
        styleType = .day
        statusBarStyle = .default
    }
    
    override open func apply() {
        super.apply()
        
        // General styling
        if let color = UIApplication.shared.delegate?.window??.tintColor {
            tintColor = color
        } else {
            tintColor = .defaultTint
        }
        
        ArrivalTimeLabel.appearance().font = UIFont.systemFont(ofSize: 18, weight: .medium).adjustedFont
        ArrivalTimeLabel.appearance().normalTextColor = .defaultPrimaryText
        BottomBannerContentView.appearance().backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        BottomBannerView.appearance().backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        Button.appearance().textColor = .defaultPrimaryText
        CancelButton.appearance().tintColor = .defaultPrimaryText
        DismissButton.appearance().backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DismissButton.appearance().textColor = #colorLiteral(red: 0.09803921569, green: 0.09803921569, blue: 0.09803921569, alpha: 1)
        DismissButton.appearance().textFont = UIFont.systemFont(ofSize: 20, weight: .medium).adjustedFont
        DistanceLabel.appearance().unitFont = UIFont.systemFont(ofSize: 14, weight: .medium).adjustedFont
        DistanceLabel.appearance().valueFont = UIFont.systemFont(ofSize: 22, weight: .medium).adjustedFont
        DistanceLabel.appearance(whenContainedInInstancesOf: [InstructionsBannerView.self]).unitTextColor = #colorLiteral(red: 0.6274509804, green: 0.6274509804, blue: 0.6274509804, alpha: 1)
        DistanceLabel.appearance(whenContainedInInstancesOf: [InstructionsBannerView.self]).valueTextColor = #colorLiteral(red: 0.431372549, green: 0.431372549, blue: 0.431372549, alpha: 1)
        DistanceLabel.appearance(whenContainedInInstancesOf: [StepInstructionsView.self]).unitTextColor = #colorLiteral(red: 0.6274509804, green: 0.6274509804, blue: 0.6274509804, alpha: 1)
        DistanceLabel.appearance(whenContainedInInstancesOf: [StepInstructionsView.self]).valueTextColor = #colorLiteral(red: 0.431372549, green: 0.431372549, blue: 0.431372549, alpha: 1)
        DistanceRemainingLabel.appearance().font = UIFont.systemFont(ofSize: 18, weight: .medium).adjustedFont
        DistanceRemainingLabel.appearance().normalTextColor = #colorLiteral(red: 0.431372549, green: 0.431372549, blue: 0.431372549, alpha: 1)
        EndOfRouteButton.appearance().textColor = .darkGray
        EndOfRouteButton.appearance().textFont = .systemFont(ofSize: 15)
        EndOfRouteContentView.appearance().backgroundColor = .white
        EndOfRouteStaticLabel.appearance().normalFont = .systemFont(ofSize: 14.0)
        EndOfRouteStaticLabel.appearance().normalTextColor = #colorLiteral(red: 0.217173934, green: 0.3645851612, blue: 0.489295125, alpha: 1)
        EndOfRouteTitleLabel.appearance().normalFont = .systemFont(ofSize: 36.0)
        EndOfRouteTitleLabel.appearance().normalTextColor = .black
        ExitView.appearance().backgroundColor = .clear
        ExitView.appearance().borderWidth = 1.0
        ExitView.appearance().cornerRadius = 5.0
        ExitView.appearance().foregroundColor = .black
        ExitView.appearance(for: UITraitCollection(userInterfaceIdiom: .carPlay)).foregroundColor = .white
        FloatingButton.appearance().backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        FloatingButton.appearance().tintColor = tintColor
        GenericRouteShield.appearance().backgroundColor = .clear
        GenericRouteShield.appearance().borderWidth = 1.0
        GenericRouteShield.appearance().cornerRadius = 5.0
        GenericRouteShield.appearance().foregroundColor = .black
        GenericRouteShield.appearance(for: UITraitCollection(userInterfaceIdiom: .carPlay)).foregroundColor = .white
        InstructionsBannerContentView.appearance().backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        InstructionsBannerView.appearance().backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        LaneView.appearance().primaryColor = .defaultLaneArrowPrimary
        LaneView.appearance().secondaryColor = .defaultLaneArrowSecondary
        LanesView.appearance().backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        LineView.appearance().lineColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
        ManeuverView.appearance().backgroundColor = .clear
        ManeuverView.appearance(whenContainedInInstancesOf: [InstructionsBannerView.self]).primaryColor = .defaultTurnArrowPrimary
        ManeuverView.appearance(whenContainedInInstancesOf: [InstructionsBannerView.self]).secondaryColor = .defaultTurnArrowSecondary
        ManeuverView.appearance(whenContainedInInstancesOf: [NextBannerView.self]).primaryColor = .defaultTurnArrowPrimary
        ManeuverView.appearance(whenContainedInInstancesOf: [NextBannerView.self]).secondaryColor = .defaultTurnArrowSecondary
        ManeuverView.appearance(whenContainedInInstancesOf: [StepInstructionsView.self]).primaryColor = .defaultTurnArrowPrimary
        ManeuverView.appearance(whenContainedInInstancesOf: [StepInstructionsView.self]).secondaryColor = .defaultTurnArrowSecondary
        NavigationMapView.appearance().maneuverArrowColor = .defaultManeuverArrow
        NavigationMapView.appearance().maneuverArrowStrokeColor = .defaultManeuverArrowStroke
        NavigationMapView.appearance().routeLineColor = .defaultRouteLine
        NavigationMapView.appearance().routeLineAlternativeColor = .defaultRouteLineAlternative
        NavigationMapView.appearance().routeLineCasingColor = .defaultRouteLineCasing
        NavigationMapView.appearance().routeLineCasingAlternativeColor = .defaultRouteLineCasingAlternative
        NavigationMapView.appearance().trafficHeavyColor = .trafficHeavy
        NavigationMapView.appearance().trafficLowColor = .trafficLow
        NavigationMapView.appearance().trafficModerateColor = .trafficModerate
        NavigationMapView.appearance().trafficSevereColor = .trafficSevere
        NavigationMapView.appearance().trafficUnknownColor = .trafficUnknown
        NavigationView.appearance().backgroundColor = #colorLiteral(red: 0.764706, green: 0.752941, blue: 0.733333, alpha: 1)
        NextBannerView.appearance().backgroundColor = #colorLiteral(red: 0.9675388083, green: 0.9675388083, blue: 0.9675388083, alpha: 1)
        NextInstructionLabel.appearance().font = UIFont.systemFont(ofSize: 20, weight: .medium).adjustedFont
        NextInstructionLabel.appearance().normalTextColor = #colorLiteral(red: 0.09803921569, green: 0.09803921569, blue: 0.09803921569, alpha: 1)
        PrimaryLabel.appearance().normalFont = UIFont.systemFont(ofSize: 30, weight: .medium).adjustedFont
        PrimaryLabel.appearance(whenContainedInInstancesOf: [InstructionsBannerView.self]).normalTextColor = #colorLiteral(red: 0.09803921569, green: 0.09803921569, blue: 0.09803921569, alpha: 1)
        PrimaryLabel.appearance(whenContainedInInstancesOf: [StepInstructionsView.self]).normalTextColor = #colorLiteral(red: 0.09803921569, green: 0.09803921569, blue: 0.09803921569, alpha: 1)
        ProgressBar.appearance().barColor = #colorLiteral(red: 0.149, green: 0.239, blue: 0.341, alpha: 1)
        ReportButton.appearance().backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        ReportButton.appearance().textColor = tintColor!
        ReportButton.appearance().textFont = UIFont.systemFont(ofSize: 15, weight: .medium).adjustedFont
        ResumeButton.appearance().backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        ResumeButton.appearance().tintColor = .defaultPrimaryText
        SecondaryLabel.appearance().normalFont = UIFont.systemFont(ofSize: 26, weight: .medium).adjustedFont
        SecondaryLabel.appearance(whenContainedInInstancesOf: [InstructionsBannerView.self]).normalTextColor = #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1)
        SecondaryLabel.appearance(whenContainedInInstancesOf: [StepInstructionsView.self]).normalTextColor = #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1)
        SeparatorView.appearance().backgroundColor = #colorLiteral(red: 0.737254902, green: 0.7960784314, blue: 0.8705882353, alpha: 1)
        StatusView.appearance().backgroundColor = UIColor.black.withAlphaComponent(2.0 / 3.0)
        StepInstructionsView.appearance().backgroundColor = #colorLiteral(red: 0.9675388083, green: 0.9675388083, blue: 0.9675388083, alpha: 1)
        StepListIndicatorView.appearance().gradientColors = [#colorLiteral(red: 0.431372549, green: 0.431372549, blue: 0.431372549, alpha: 1), #colorLiteral(red: 0.6274509804, green: 0.6274509804, blue: 0.6274509804, alpha: 1), #colorLiteral(red: 0.431372549, green: 0.431372549, blue: 0.431372549, alpha: 1)]
        StepTableViewCell.appearance().backgroundColor = #colorLiteral(red: 0.9675388083, green: 0.9675388083, blue: 0.9675388083, alpha: 1)
        StepsBackgroundView.appearance().backgroundColor = #colorLiteral(red: 0.9675388083, green: 0.9675388083, blue: 0.9675388083, alpha: 1)
        TimeRemainingLabel.appearance().font = UIFont.systemFont(ofSize: 28, weight: .medium).adjustedFont
        TimeRemainingLabel.appearance().normalTextColor = .defaultPrimaryText
        TimeRemainingLabel.appearance().trafficHeavyColor = #colorLiteral(red: 0.91, green: 0.20, blue: 0.25, alpha: 1.0)
        TimeRemainingLabel.appearance().trafficLowColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        TimeRemainingLabel.appearance().trafficModerateColor = #colorLiteral(red: 0.95, green: 0.65, blue: 0.31, alpha: 1.0)
        TimeRemainingLabel.appearance().trafficSevereColor = #colorLiteral(red: 0.7705719471, green: 0.1753477752, blue: 0.1177056804, alpha: 1)
        TimeRemainingLabel.appearance().trafficUnknownColor = .defaultPrimaryText
        UserPuckCourseView.appearance().puckColor = #colorLiteral(red: 0.149, green: 0.239, blue: 0.341, alpha: 1)
        WayNameLabel.appearance().normalFont = UIFont.systemFont(ofSize: 20, weight: .medium).adjustedFont
        WayNameLabel.appearance().normalTextColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        WayNameView.appearance().backgroundColor = UIColor.defaultRouteLayer.withAlphaComponent(0.85)
        WayNameView.appearance().borderColor = UIColor.defaultRouteLineCasing.withAlphaComponent(0.8)
    }
}

/**
 `NightStyle` is the default night style for Mapbox Navigation SDK. Only will be applied when necessary and if `automaticallyAdjustStyleForSunPosition`.
 */
@objc(MBNightStyle)
open class NightStyle: DayStyle {
    public required init(mapStyleURL: URL) {
        super.init(mapStyleURL: mapStyleURL)
        styleType = .night
        statusBarStyle = .lightContent
    }
    
    override open func apply() {
        super.apply()
        
        let backgroundColor = #colorLiteral(red: 0.1493228376, green: 0.2374534607, blue: 0.333029449, alpha: 1)
        
        ArrivalTimeLabel.appearance().normalTextColor = #colorLiteral(red: 0.7991961837, green: 0.8232284188, blue: 0.8481693864, alpha: 1)
        BottomBannerContentView.appearance().backgroundColor = backgroundColor
        BottomBannerView.appearance().backgroundColor = backgroundColor
        Button.appearance().textColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        CancelButton.appearance().tintColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        DismissButton.appearance().backgroundColor = backgroundColor
        DismissButton.appearance().textColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        DistanceLabel.appearance(whenContainedInInstancesOf: [InstructionsBannerView.self]).unitTextColor = #colorLiteral(red: 0.7991961837, green: 0.8232284188, blue: 0.8481693864, alpha: 1)
        DistanceLabel.appearance(whenContainedInInstancesOf: [InstructionsBannerView.self]).valueTextColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        DistanceLabel.appearance(whenContainedInInstancesOf: [StepInstructionsView.self]).unitTextColor = #colorLiteral(red: 0.7991961837, green: 0.8232284188, blue: 0.8481693864, alpha: 1)
        DistanceLabel.appearance(whenContainedInInstancesOf: [StepInstructionsView.self]).valueTextColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        DistanceRemainingLabel.appearance().normalTextColor = #colorLiteral(red: 0.7991961837, green: 0.8232284188, blue: 0.8481693864, alpha: 1)
        EndOfRouteButton.appearance().textColor = .white
        EndOfRouteContentView.appearance().backgroundColor = backgroundColor
        EndOfRouteStaticLabel.appearance().alpha = 1.0
        EndOfRouteStaticLabel.appearance().textColor = UIColor.white.withAlphaComponent(0.9)
        EndOfRouteTitleLabel.appearance().textColor = .white
        ExitView.appearance().foregroundColor = .white
        FloatingButton.appearance().backgroundColor = backgroundColor
        FloatingButton.appearance().tintColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        GenericRouteShield.appearance().foregroundColor = .white
        InstructionsBannerContentView.appearance().backgroundColor = backgroundColor
        InstructionsBannerView.appearance().backgroundColor = backgroundColor
        LaneView.appearance().primaryColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        LanesView.appearance().backgroundColor = backgroundColor
        ManeuverView.appearance().backgroundColor = .clear
        ManeuverView.appearance(whenContainedInInstancesOf: [InstructionsBannerView.self]).primaryColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        ManeuverView.appearance(whenContainedInInstancesOf: [InstructionsBannerView.self]).secondaryColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3)
        ManeuverView.appearance(whenContainedInInstancesOf: [NextBannerView.self]).primaryColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        ManeuverView.appearance(whenContainedInInstancesOf: [NextBannerView.self]).secondaryColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3)
        ManeuverView.appearance(whenContainedInInstancesOf: [StepInstructionsView.self]).primaryColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        ManeuverView.appearance(whenContainedInInstancesOf: [StepInstructionsView.self]).secondaryColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3)
        NavigationView.appearance().backgroundColor = #colorLiteral(red: 0.0470588, green: 0.0509804, blue: 0.054902, alpha: 1)
        NextBannerView.appearance().backgroundColor = #colorLiteral(red: 0.103291966, green: 0.1482483149, blue: 0.2006777823, alpha: 1)
        NextInstructionLabel.appearance().normalTextColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        PrimaryLabel.appearance(whenContainedInInstancesOf: [InstructionsBannerView.self]).normalTextColor = #colorLiteral(red: 0.9996390939, green: 1, blue: 0.9997561574, alpha: 1)
        PrimaryLabel.appearance(whenContainedInInstancesOf: [StepInstructionsView.self]).normalTextColor = #colorLiteral(red: 0.9996390939, green: 1, blue: 0.9997561574, alpha: 1)
        ProgressBar.appearance().barColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        ReportButton.appearance().backgroundColor = backgroundColor
        ReportButton.appearance().textColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        ResumeButton.appearance().backgroundColor = backgroundColor
        ResumeButton.appearance().tintColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        SecondaryLabel.appearance(whenContainedInInstancesOf: [InstructionsBannerView.self]).normalTextColor = #colorLiteral(red: 0.7349056005, green: 0.7675836682, blue: 0.8063536286, alpha: 1)
        SecondaryLabel.appearance(whenContainedInInstancesOf: [StepInstructionsView.self]).normalTextColor = #colorLiteral(red: 0.7349056005, green: 0.7675836682, blue: 0.8063536286, alpha: 1)
        SeparatorView.appearance().backgroundColor = #colorLiteral(red: 0.3764705882, green: 0.4901960784, blue: 0.6117647059, alpha: 0.796599912)
        StepInstructionsView.appearance().backgroundColor = #colorLiteral(red: 0.103291966, green: 0.1482483149, blue: 0.2006777823, alpha: 1)
        StepTableViewCell.appearance().backgroundColor = #colorLiteral(red: 0.103291966, green: 0.1482483149, blue: 0.2006777823, alpha: 1)
        StepsBackgroundView.appearance().backgroundColor = #colorLiteral(red: 0.103291966, green: 0.1482483149, blue: 0.2006777823, alpha: 1)
        TimeRemainingLabel.appearance().normalTextColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        TimeRemainingLabel.appearance().trafficUnknownColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        WayNameView.appearance().borderColor = #colorLiteral(red: 0.2802129388, green: 0.3988235593, blue: 0.5260632038, alpha: 1)
    }
}
