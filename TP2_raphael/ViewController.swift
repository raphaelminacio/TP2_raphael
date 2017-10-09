//=======================================
import UIKit
//=======================================
class ViewController: UIViewController {
    //---------------------------
    /* Ici sont les connexions avec les images des cartes */
    @IBOutlet weak var back_1: UIView!
    @IBOutlet weak var front_1: UIView!
    @IBOutlet weak var back_2: UIView!
    @IBOutlet weak var front_2: UIView!
    @IBOutlet weak var back_3: UIView!
    @IBOutlet weak var front_3: UIView!
    @IBOutlet weak var back_4: UIView!
    @IBOutlet weak var front_4: UIView!
    @IBOutlet weak var back_5: UIView!
    @IBOutlet weak var front_5: UIView!
    @IBOutlet weak var back_6: UIView!
    @IBOutlet weak var front_6: UIView!
    @IBOutlet weak var back_7: UIView!
    @IBOutlet weak var front_7: UIView!
    @IBOutlet weak var back_8: UIView!
    @IBOutlet weak var front_8: UIView!
    @IBOutlet weak var back_9: UIView!
    @IBOutlet weak var front_9: UIView!
    @IBOutlet weak var back_10: UIView!
    @IBOutlet weak var front_10: UIView!
    @IBOutlet weak var back_11: UIView!
    @IBOutlet weak var front_11: UIView!
    @IBOutlet weak var back_12: UIView!
    @IBOutlet weak var front_12: UIView!

    /* Ici sont les connexions avec les images juste du "back" qui seront appéllés par la function "setImagesToCards"*/

    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    @IBOutlet weak var imgView4: UIImageView!
    @IBOutlet weak var imgView5: UIImageView!
    @IBOutlet weak var imgView6: UIImageView!
    @IBOutlet weak var imgView7: UIImageView!
    @IBOutlet weak var imgView8: UIImageView!
    @IBOutlet weak var imgView9: UIImageView!
    @IBOutlet weak var imgView10: UIImageView!
    @IBOutlet weak var imgView11: UIImageView!
    @IBOutlet weak var imgView12: UIImageView!
    
    /* Ici sont les connexions avec les chaque carte au complet */
    @IBOutlet weak var card_1: UIView!
    @IBOutlet weak var card_2: UIView!
    @IBOutlet weak var card_3: UIView!
    @IBOutlet weak var card_4: UIView!
    @IBOutlet weak var card_5: UIView!
    @IBOutlet weak var card_6: UIView!
    @IBOutlet weak var card_7: UIView!
    @IBOutlet weak var card_8: UIView!
    @IBOutlet weak var card_9: UIView!
    @IBOutlet weak var card_10: UIView!
    @IBOutlet weak var card_11: UIView!
    @IBOutlet weak var card_12: UIView!

    /* Tableau de imageView optionnelle */
    var arrayOfImageViews: [UIImageView]!
    
    /* Tableau de String que sera utilisé par la function "setImagesToCards"pour faire une boucle */
    var arrayOfAnimalNames = ["cat.png","cat.png", "chick.png", "chick.png", "cow.png","cow.png", "dog.png", "dog.png", "pig.png", "pig.png", "sheep.png", "sheep.png"]
    
    /* Tableau vide que va recevoir, au hasard, les noms des animaux */
    var arrayOfRandomAnimalNames = [String]()
    
    /* Tableau vide que représente les cartes que l'utilisateur va avoir sélectionné */
    var arrayChosenCards = [String]()
    
    /* Tableau vide que représente les cartes */
    var arrayOfCards = [UIView]()
    
    /* Ces deux tableau vont apporter le "back" et "front" au "flipcard" de chaque tag de la fonction "showCards" */
    var arrayOfShowingBacks = [UIView]()
    var arrayOfHidingFronts = [UIView]()
    
    /* Tableau que sera appelé par la méthode "reset" */
    var cards: [UIView]!
    
    //---------------------------
    /* "Lorsque le document est prêt" il va exécuter tout ce qu'il y a dedans */
    override func viewDidLoad() {
        super.viewDidLoad()
        cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10, card_11, card_12]
        arrayOfImageViews = [imgView1, imgView2, imgView3, imgView4, imgView5, imgView6, imgView7, imgView8, imgView9, imgView10, imgView11, imgView12]
        randomAnimals()
        setImagesToCards()
    }
    //---------------------------
    /* La méthode "flipCard"est responsable pour faire la transition entre le "back" et le "front" */
    /* l'objet "transitionOptions" va être égal à un tableau avec les options de transitions */
    /* la ligne "animations: {from.isHidden = true" veut dire que quand la carte fait sa transition, elle va disparaître; la ligne "animations: {to.isHidden = false" veut dire que quand la carte fait sa transition, elle sera visible */
    
    func flipCard (from: UIView, to: UIView) {
        let transitionOptions: UIViewAnimationOptions =         [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: from, duration: 1.0, options: transitionOptions,
                          animations: {
                            from.isHidden = true
        })
        UIView.transition(with: to, duration: 1.0, options: transitionOptions,
                          animations: {
                            to.isHidden = false
        })
    }
    //---------------------------
    /* Méthode que va faire une conexion avec les boutons de chaque cartes en donnant une tag à chaque bouton; si, le "sender" envoie la tag 0, va flipper la carte de "front_1" à "back_1" ; chaque fois que a un click sur une carte, cette fonction va tenter d'exécuter la méthode "verification"*/
    
    @IBAction func showCards(_ sender: UIButton) {
        if arrayOfHidingFronts.count == 2 {   /* une fois qu'on a deux cartes qui apparaît, on empêche que l'utilisateur puisse ouvrir d'autres */
            return
        }
        
        switch sender.tag {
        case 0:
            flipCard(from: front_1, to: back_1)
            arrayOfCards.append(card_1)
            arrayOfShowingBacks.append(back_1)  /* on ajoute "arrayOfShowingBacks" et "arrayOfHidingFronts" pour faire un re-flip */
            arrayOfHidingFronts.append(front_1)
        case 1:
            flipCard(from: front_2, to: back_2)
            arrayOfCards.append(card_2)
            arrayOfShowingBacks.append(back_2)
            arrayOfHidingFronts.append(front_2)
        case 2:
            flipCard(from: front_3, to: back_3)
            arrayOfCards.append(card_3)
            arrayOfShowingBacks.append(back_3)
            arrayOfHidingFronts.append(front_3)
        case 3:
            flipCard(from: front_4, to: back_4)
            arrayOfCards.append(card_4)
            arrayOfShowingBacks.append(back_4)
            arrayOfHidingFronts.append(front_4)
        case 4:
            flipCard(from: front_5, to: back_5)
            arrayOfCards.append(card_5)
            arrayOfShowingBacks.append(back_5)
            arrayOfHidingFronts.append(front_5)
        case 5:
            flipCard(from: front_6, to: back_6)
            arrayOfCards.append(card_6)
            arrayOfShowingBacks.append(back_6)
            arrayOfHidingFronts.append(front_6)
        case 6:
            flipCard(from: front_7, to: back_7)
            arrayOfCards.append(card_7)
            arrayOfShowingBacks.append(back_7)
            arrayOfHidingFronts.append(front_7)
        case 7:
            flipCard(from: front_8, to: back_8)
            arrayOfCards.append(card_8)
            arrayOfShowingBacks.append(back_8)
            arrayOfHidingFronts.append(front_8)
        case 8:
            flipCard(from: front_9, to: back_9)
            arrayOfCards.append(card_9)
            arrayOfShowingBacks.append(back_9)
            arrayOfHidingFronts.append(front_9)
        case 9:
            flipCard(from: front_10, to: back_10)
            arrayOfCards.append(card_10)
            arrayOfShowingBacks.append(back_10)
            arrayOfHidingFronts.append(front_10)
        case 10:
            flipCard(from: front_11, to: back_11)
            arrayOfCards.append(card_11)
            arrayOfShowingBacks.append(back_11)
            arrayOfHidingFronts.append(front_11)
        case 11:
            flipCard(from: front_12, to: back_12)
            arrayOfCards.append(card_12)
            arrayOfShowingBacks.append(back_12)
            arrayOfHidingFronts.append(front_12)
        default:
            break
        }
        arrayChosenCards.append(arrayOfRandomAnimalNames[sender.tag])
        verification()
    }
    //---------------------------
    /* Cette méthode a comme but "setter" une image dans un ImageView */
    func setImagesToCards() {
        var number = 0
        for imgView in arrayOfImageViews {
            imgView.image = UIImage(named: arrayOfRandomAnimalNames[number])
            number = number + 1
        }
        
    }
    //---------------------------
    func randomAnimals() {
        let numberOfAnimals = arrayOfAnimalNames.count
        for _ in 1...numberOfAnimals {
            let randomNumber =
                Int(arc4random_uniform(UInt32(arrayOfAnimalNames.count)))
            arrayOfRandomAnimalNames.append(arrayOfAnimalNames[randomNumber])
            arrayOfAnimalNames.remove(at: randomNumber)
        }
    }
    //---------------------------
    /* Cette méthode regarde s'il y a deux cartes ouverts; si oui, elle fait la vérification; si non, elle ignore */
    func verification() {
        if arrayChosenCards.count == 2 {   /* si le nombre d'éléments dans le tableau est égal à 2, va comparer les éléments */
            if arrayChosenCards[0] == arrayChosenCards[1] {
                Timer.scheduledTimer(timeInterval: 2,
                                     target: self,
                                     selector: (#selector(hideCards)),
                                     userInfo: nil,
                                     repeats: false)
            } else {
                arrayOfCards = []
            }
            arrayChosenCards = []
        }
        resetCards()
    }
    //---------------------------
    /* Cette méthode fait disparaître les cartes une fois qu'elles sont pareilles */
    @objc func hideCards() {
        arrayOfCards[0].isHidden = true
        arrayOfCards[1].isHidden = true
        arrayOfCards = []
    }
    //-----------------------
    /* Cette méthode va aller chercher les éléments dans un des deux tableaus, soit "arrayOfShowingBacks", soit "arrayOfHidingFronts" */
    @objc func reflip() {
        for index in 0..<arrayOfShowingBacks.count {
            flipCard(from: arrayOfShowingBacks[index], to:
                arrayOfHidingFronts[index])
        }
        arrayOfShowingBacks = []
        arrayOfHidingFronts = []
    }
    //-----------------------
    func resetCards() {
        if arrayOfShowingBacks.count == 2 {
            Timer.scheduledTimer(timeInterval: 2,
                                 target: self,
                                 selector: (#selector(reflip)),
                                 userInfo: nil,
                                 repeats: false)
        }
    }
    //-----------------------
    @IBAction func reset(_ sender: Any) {
        for card in cards {    /* pour faire le reset, ici va montrer les cartes */
            card.isHidden = false
        } /* ici arrayOfAnimalNames va remplir avec les noms */
        arrayOfAnimalNames = ["cat.png","cat.png", "chick.png", "chick.png", "cow.png","cow.png", "dog.png", "dog.png", "pig.png", "pig.png", "sheep.png", "sheep.png"]
        arrayOfRandomAnimalNames = []  /* après il vidé le tableau random */
        randomAnimals() /* cette méthode va re-remplir arrayOfRandomAnimalNames*/
        setImagesToCards()
    }
    
    //-----------------------
}
