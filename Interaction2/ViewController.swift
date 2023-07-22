//
//  ViewController.swift
//  Interaction2
//
//  Created by HAMDI TLILI on 19/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet var buttonsArray: [UIButton]!
    
    
    var colors : [UIColor] = [.red, .green, .blue, .orange]
    var isTouched = false
    var cornerRadius: CGFloat = 30
    var labelTapped = false
    var center: CGPoint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.layer.cornerRadius = cornerRadius
        for index in 0..<buttonsArray.count {
            buttonsArray[index].backgroundColor = colors[index]
        }
        //Definir la possibilité d'interaction de l'utlilisateur.
        //myButton.isUserInteractionEnabled = false
        
        // Définir l'accessibilité du Bouton
        //myButton.isEnabled = false
        myLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabel))
        //Pour taper 2 fois
        //tap.numberOfTapsRequired = 2
        myLabel.addGestureRecognizer(tap)
        center = myImage.center
        myImage.isUserInteractionEnabled = true
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        center = myImage.center
        if let first = setUpTouch(touches: touches) {
        print("Première position = \(first)")
        }
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let newPoint = setUpTouch(touches: touches) {
            myImage.center = newPoint
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let lastTouched = setUpTouch(touches: touches){
            print("Dernière position = \(lastTouched)")
            myImage.center = center
        }
    }
    
    func setUpTouch(touches: Set<UITouch>) -> CGPoint? {
        if let first = touches.first {
            if first.view == myImage {
                return first.location(in: view)
            }
        }
        return nil
    }
    @objc func tapLabel() {
         print("Je suis touché")
        labelTapped.toggle() // ou bien labeTapped = !labelTapped
        myLabel.font = labelTapped ? UIFont.boldSystemFont(ofSize: 20) : UIFont.systemFont(ofSize: 17)
        
     }
    @IBAction func buttonAction(_ sender: Any) {
        isTouched.toggle()
        cornerRadius = isTouched ? 10 : 30
        myButton.layer.cornerRadius = cornerRadius
        
    }
    @IBAction func multipleActions(_ sender: UIButton) {
        print(sender.tag)
        myButton.backgroundColor = colors[sender.tag]
    }
    

}

