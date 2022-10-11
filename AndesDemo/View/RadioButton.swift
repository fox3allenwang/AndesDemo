
import UIKit
@IBDesignable

class RadioButton: UIButton {
    @IBInspectable var selectedButtonColor:UIColor = UIColor.black
    @IBInspectable var borderColor:UIColor = UIColor.black
    
    override func draw(_ rect: CGRect) {
        self.tintColor = UIColor.clear
        layer.cornerRadius = self.frame.width / 2
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
    }
}
class CustomButton: UIButton {
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setButton()
    }
    override func awakeFromNib() {
        setButton()
    }
    func setButton(){
        self.setTitleColor(#colorLiteral(red:1, green: 1, blue: 1, alpha: 1), for: .normal)
        self.layer.cornerRadius = self.bounds.height / 2
        self.backgroundColor = .systemBlue
        self.layer.borderWidth = 0
        self.titleLabel?.font = UIFont(name: "System", size: 13)
    }
}
class CustomTextField: UITextField {
    @IBInspectable public var borderColor: UIColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1) {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable public var borderwidth: CGFloat = 1{
        didSet{
            self.layer.borderWidth = borderwidth
        }
    }
    override func awakeFromNib() {
        self.layer.shadowOffset.height = 1
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0.6774011254, blue: 1, alpha: 1)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.2
    }
}
