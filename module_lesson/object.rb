class User
end

# Userクラス自身のクラスはClassクラス
p User.class #=> Class

# ClassクラスのスーパークラスはModuleクラス
p Class.superclass #=> Module

module Loggable
end

# Loggableモジュール自身はクラスのModuleクラス
p Loggable.class #=> Module

# ModuleクラスのスーパークラスはObjectクラス
p Module.superclass #=> Object

# クラス構文やモジュール構文の内部（構文の直下）ではselfがクラス自身やモジュール自身を指している
class User
  p self #=> User
  p self.class #=> Class
end

module Loggable
  p self #=> Loggable
  p self.class #=> Module
end