

require('UIButton,UIColor');
defineClass('JSPatchViewController', {
            createUI: function() {
            
            
          
            var button = UIButton.alloc().initWithFrame({x: 50, y: 100, width: 200,height: 50});
            button.setTitle_forState("修复的button", 0);
            
            button.setBackgroundColor(UIColor.redColor());
            self.view().addSubview(button);
            
            
            
            },
            });
