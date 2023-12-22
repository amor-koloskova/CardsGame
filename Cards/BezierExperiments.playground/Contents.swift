//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
        // создаем кривые на сцене
        createBezier(on: view)
    }
    
    private func createBezier(on view: UIView) {
        // создаем графический контекст (слой)
        let shapeLayer = CAShapeLayer()
        // добавляем слой в качестве дочернего к корневому слою корневого представления
        view.layer.addSublayer(shapeLayer)
        // изменение цвета линий
        shapeLayer.strokeColor = UIColor.gray.cgColor
        // изменение толщины линий
        shapeLayer.lineWidth = 5
        // определение фонового цвета
        shapeLayer.fillColor = UIColor.green.cgColor
        
        // если нужна прозрачная фигура:
        //        shapeLayer.fillColor = nil
        //        shapeLayer.fillColor = UIColor.clear.cgColor
        
        // определение крайних точек всех линий и пунктира
        shapeLayer.lineCap = .round
        
        // пунктирные линии
        // поочередно рисует закрашенные и не закрашенные сегменты размером 3 точки:
        //        shapeLayer.lineDashPattern = [3]
        // каждый закрашенный сегмент будет иметь размер 3 точки, а не закрашенный – 6 точек:
        //        shapeLayer.lineDashPattern = [3, 6]
        
        // меняет длину пунктира на 2
        //        shapeLayer.lineDashPhase = 2
        
        // чтобы линия прорисовывалась не полностью:
        //        shapeLayer.strokeStart = 0.6 или
        //        shapeLayer.strokeEnd = 0.85
        
        // определение стиля оформления соединительных точек
        //        shapeLayer.lineJoin = .bevel
        
        // создание фигуры
        shapeLayer.path = getPath().cgPath
    }
    
    private func getPath() -> UIBezierPath {
        var path = UIBezierPath()
        path.move(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 150, y: 50))
        // создание второй линии
        path.addLine(to: CGPoint(x: 150, y: 150))
       // завершение фигуры (вместо третьей линии)
        path.close()
        
        // создание второго треугольника
        path.move(to: CGPoint(x: 50, y: 70))
        path.addLine(to: CGPoint(x: 150, y: 170))
        path.addLine(to: CGPoint(x: 50, y: 170))
        path.close()
        
        // создание прямоугольника
        var rect = CGRect(x: 10, y: 10, width: 200, height: 100)
        path = UIBezierPath(roundedRect: rect, cornerRadius: 30)
        // чтобы скруглить только необходимые углы:
        //        let path = UIBezierPath(roundedRect: rect,
        //        byRoundingCorners: [.bottomRight, .topLeft], cornerRadii: CGSize(width: 30, height: 0))
        
        //создание дуги
        let centerPoint = CGPoint(x: 200, y: 200)
        path = UIBezierPath(arcCenter: centerPoint, radius: 150, startAngle: .pi/5, endAngle: .pi, clockwise: true)
        
        // создание круга с помощью дуги:
        path = UIBezierPath(arcCenter: centerPoint, radius: 150, startAngle: 0, endAngle: .pi*2, clockwise: true)
        
        // создание овала любой формы
        rect = CGRect(x: 150, y: 150, width: 200, height: 100)
        path = UIBezierPath(ovalIn: rect)
        
        // создание кривой
        path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 10))
        path.addCurve(to: CGPoint(x: 200, y: 200), controlPoint1: CGPoint(x: 200, y: 20), controlPoint2: CGPoint(x: 20, y: 200))
        
        // создание фигуры "Поварская шапка"
        path = UIBezierPath()
        path.move(to: CGPoint(x: 100, y: 200))
        path.addArc(withCenter: CGPoint(x: 150, y: 200), radius: 50, startAngle: .pi, endAngle: 0, clockwise: true)
        path.addLine(to: CGPoint(x: 220, y: 200))
        path.addArc(withCenter: CGPoint(x: 220, y: 250), radius: 50, startAngle: .pi*3/2, endAngle: .pi/2, clockwise: true)
        path.addLine(to: CGPoint(x: 200, y: 300))
        path.addLine(to: CGPoint(x: 200, y: 360))
        path.addLine(to: CGPoint(x: 100, y: 360))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.addLine(to: CGPoint(x: 80, y: 300))
        path.addArc(withCenter: CGPoint(x: 80, y: 250), radius: 50, startAngle: .pi/2, endAngle: .pi*3/2, clockwise: true)
        path.close()
        return path
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
