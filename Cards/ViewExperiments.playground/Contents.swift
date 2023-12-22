//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
       setUpViews()
    }
    
    // настройка представлений сцены
    private func setUpViews() {
        self.view = getRootView()
        let redView = getRedView()
        let greenView = getGreenView()
        let whiteView = getWhiteView()
        
        // поворот красного представления
        redView.transform = CGAffineTransform(rotationAngle: .pi/3)
        let pinkView = getPinkView()
        set(view: greenView, toCenterOfView: redView)
        whiteView.center = greenView.center
        self.view.addSubview(redView)
        redView.addSubview(greenView)
        redView.addSubview(whiteView)
        self.view.addSubview(pinkView)
        
        
    }
    
    private func getRootView() -> UIView {
        // создание корневого view
          let view = UIView()
          view.backgroundColor = .gray
        return view
    }
    
    // создание красного представления
    private func getRedView() -> UIView {
        let viewFrame = CGRect(x: 50, y: 50, width: 200, height: 200)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .red
        view.clipsToBounds = true
        return view
    }
    
    private func getGreenView() -> UIView {
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 180, height: 180))
        view.backgroundColor = .green
        return view
    }
    
    private func getWhiteView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = .white
        return view
    }
    
    private func getPinkView() -> UIView {
        let view = UIView(frame: CGRect(x: 50, y: 300, width: 100, height: 100))
        view.backgroundColor = .systemPink
        // толщина границ
        view.layer.borderWidth = 5
        // цвет границ
        view.layer.borderColor = UIColor.yellow.cgColor
        //скругление углов
        view.layer.cornerRadius = 10
        // видимость тени
        view.layer.shadowOpacity = 0.95
        // радиус размытия тени
        view.layer.shadowRadius = 10
        // смещение тени
        view.layer.shadowOffset = CGSize(width: 10, height: 20)
        // цвет тени
        view.layer.shadowColor = UIColor.white.cgColor
        // прозрачность слоя
        view.layer.opacity = 0.7
        // цвет фона
        view.layer.backgroundColor = UIColor.systemPink.cgColor
        
        // создание дочернего слоя
        let layer = CALayer()
        layer.backgroundColor = UIColor.black.cgColor
        layer.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        layer.cornerRadius = 10
        // Для того, чтобы добавить слой в качестве дочернего, помимо метода addSublayer вы можете использовать группу методов с именем insertSublayer, которые имеют более гибкие возможности.
        view.layer.addSublayer(layer)
        print(view.frame)
        
        // поворот представления на 45 градусов
        // При создании значения CGAffineTransform в качестве аргумента rotationAngle передается угол, на который необходимо повернуть изображение. Данный угол выражен в радианах, а не в градусах.
    //        view.transform = CGAffineTransform(rotationAngle: .pi/4)
       
        // Чтобы изменить точку привязки (anchor point), относительно которой будет происходить трансформация:
    // view.layer.anchorPoint = CGPoint(x: 0, y: 0)
        
        // Растяжение представления
    //        view.transform = CGAffineTransform(scaleX: 1.5, y: 0.7)
        
        // Смещение
        view.transform = CGAffineTransform(translationX: 100, y: 5)
        
        // Цепочка преобразований
        view.transform = CGAffineTransform(rotationAngle: .pi/3).scaledBy(x: 2, y: 0.8).translatedBy(x: 50, y: 50)
        
        // Отмена всех преобразований с помощью transform
        view.transform = CGAffineTransform.identity
        // Метод наоборот, повернет на -45 градусов
    //        view.transform = CGAffineTransform(rotationAngle: .pi/4).inverted()
        return view
    }
    
    private func set(view moveView: UIView, toCenterOfView baseView: UIView) {
        moveView.center = CGPoint(x: baseView.bounds.midX, y: baseView.bounds.midY)
//        // размеры вложенного представления
//        let moveViewWidth = moveView.frame.width
//        let moveViewHeight = moveView.frame.height
//        
//        // размеры родительского представления
//        let baseViewWidth = baseView.bounds.width
//        let baseViewHeight = baseView.bounds.height
//
//        // вычисление и изменение координат
//        let newXCoordinate = (baseViewWidth - moveViewWidth) / 2
//        let newYCoordinate = (baseViewHeight - moveViewHeight) / 2
//        
//        moveView.frame.origin = CGPoint(x: newXCoordinate, y: newYCoordinate)
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
