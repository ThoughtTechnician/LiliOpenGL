NAME=liliOpenGL
CXX=g++
CPPFLAGS=-std=c++11 -g
LDLIBS=-lglfw -lGLEW -lGL -lSOIL
ODIR=objs
TOOLS=Shader Sprite
OBJS=$(TOOLS:%=$(ODIR)/%.o)
SHADERS=spriteVert.glsl spriteFrag.glsl

default: $(NAME)

$(NAME): main.cpp $(OBJS) $(SHADERS)
	$(CXX) $(CPPFLAGS) -o $(NAME) $(LDLIBS) $(OBJS) main.cpp

$(ODIR)/Shader.o: Shader.cpp Shader.hpp
	$(CXX) $(CPPFLAGS) -c Shader.cpp -o $@

$(ODIR)/Sprite.o: Sprite.cpp Sprite.hpp
	$(CXX) $(CPPFLAGS) -c Sprite.cpp -o $@

clean: 
	rm $(ODIR)/*
	rm $(NAME)
