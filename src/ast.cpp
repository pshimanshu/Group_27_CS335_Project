#include "ast.h"


#include<assert.h>
#include<string>
#include<iostream>
#include<sstream>

static unsigned long long int id_count = 0;

unsigned long long int get_next_node_id() {
	return id_count++;
}

GraphNode::GraphNode() : id(get_next_node_id()) {};

GraphNode::GraphNode(unsigned int _line_num, unsigned int _column ) : id(get_next_node_id()) , line_num(_line_num), column(_column) {};

unsigned long long int GraphNode::get_id() {
	return id;
}

Terminal::Terminal(const char* name_, const char* value_) {
	name = std::string(name_);
	if (value_) value = std::string(value_);
	std::cout << id << " " << name  << "\n";
}

Terminal::Terminal(const char* name_, const char* value_, unsigned int _line_num, unsigned int _column ) : GraphNode(_line_num, _column){
	name = std::string(name_);
	if (value_) value = std::string(value_);
	std::cout << id << " " << name  << "\n";
}


Non_Terminal::Non_Terminal(const char* name_) {
	name = std::string(name_);
	std::cout << id << " " << name  << "\n";
}

/* These should never be called in objects of type GraphNode or Terminal */
void GraphNode::add_child (GraphNode* node) {
	assert(0);
}

void GraphNode::add_children (GraphNode* node1, GraphNode* node2) {
	assert(0);
}

void GraphNode::add_children (GraphNode* node1, GraphNode* node2, GraphNode* node3) {
	assert(0);
}


void GraphNode::add_children (GraphNode* node1, GraphNode* node2, GraphNode* node3, GraphNode* node4) {
	assert(0);
}

void Terminal:: dotify () {
	if(is_printed){
		is_printed = 0;
		std::stringstream ss;
		ss << "\t" << id << " [label=\"" << name << " : " << value << "\"];\n";
		file_writer(ss.str());
	}
}

void Non_Terminal:: dotify () {
	if(is_printed){
		is_printed = 0;
		std::stringstream ss;
		ss << "\t" << id << " [label=\"" << name << "\"];\n";
		for (auto it = children.begin(); it != children.end(); it++) {
			ss << "\t" << id << " -> " << (*it)->id << ";\n";
		}
		file_writer(ss.str());

		for(auto it = children.begin(); it != children.end(); it++){
			(*it)->dotify();
		}
	}
}

void Non_Terminal::add_child (GraphNode* node) {
	if( node != NULL) {
		children.push_back(node);
	}
}


void Non_Terminal::add_children (GraphNode* node1, GraphNode* node2) {
	if( node1 != NULL) {
		children.push_back(node1);
	}
	if( node2 != NULL) {
		children.push_back(node2);
	}
}

void Non_Terminal::add_children (GraphNode* node1, GraphNode* node2, GraphNode* node3) {
	if( node1 != NULL) {
		children.push_back(node1);
	}
	if( node2 != NULL) {
		children.push_back(node2);
	}
	if( node3 != NULL) {
		children.push_back(node3);
	}
}

void Non_Terminal::add_children (GraphNode* node1, GraphNode* node2, GraphNode* node3, GraphNode* node4) {
	if( node1 != NULL) {
		children.push_back(node1);
	}
	if( node2 != NULL) {
		children.push_back(node2);
	}
	if( node3 != NULL) {
		children.push_back(node3);
	}
	if( node4 != NULL) {
		children.push_back(node4);
	}
}

GraphNode* create_terminal(const char* name, const char* value) {
	Terminal* terminal_node = new Terminal(name,value);
	terminal_node->dotify();
	return terminal_node;
}

Terminal* create_terminal(const char* name, const char* value, unsigned int line_num, unsigned int column){
	Terminal* terminal_node = new Terminal(name,value,line_num,column);
	terminal_node->dotify();
	return terminal_node;
}


GraphNode* create_non_terminal(const char* name) {
	Non_Terminal* node = new Non_Terminal(name);
	node->dotify();
	return node;
}

GraphNode* create_non_terminal(const char* name, GraphNode* node1, GraphNode* node2, GraphNode* node3, GraphNode* node4, GraphNode* node5, GraphNode* node6, GraphNode* node7) {
	Non_Terminal* node = new Non_Terminal(name);
	node->add_children(node1, node2, node3, node4);
	node->add_children(node5, node6, node7);
	if( node->children.empty() ) {
		delete node;
		return NULL;
	}
	node->dotify();
	return node;
}

GraphNode* create_non_terminal(const char* name, GraphNode* node1, GraphNode* node2, GraphNode* node3, GraphNode* node4, GraphNode* node5, GraphNode* node6) {
	Non_Terminal* node = new Non_Terminal(name);
	node->add_children(node1, node2, node3, node4);
	node->add_children(node5, node6);
	if( node->children.empty() ) {
		delete node;
		return NULL;
	}
	node->dotify();
	return node;
}

GraphNode* create_non_terminal(const char* name, GraphNode* node1, GraphNode* node2, GraphNode* node3, GraphNode* node4, GraphNode* node5) {
	Non_Terminal* node = new Non_Terminal(name);
	node->add_children(node1, node2, node3);
	node->add_children(node4, node5);
	if( node->children.empty() ) {
		delete node;
		return NULL;
	}
	node->dotify();
	return node;
}




GraphNode* create_non_terminal(const char* name, GraphNode* node1, GraphNode* node2, GraphNode* node3, GraphNode* node4) {
	Non_Terminal* node = new Non_Terminal(name);
	node->add_children(node1, node2, node3, node4);
	if( node->children.empty() ) {
		delete node;
		return NULL;
	}
	node->dotify();
	return node;
}

GraphNode* create_non_terminal(const char* name, GraphNode* node1, GraphNode* node2, GraphNode* node3) {
	Non_Terminal* node = new Non_Terminal(name);
	node->add_children(node1, node2, node3);
	if( node->children.empty() ) {
		delete node;
		return NULL;
	}
	node->dotify();
	return node;
}

GraphNode* create_non_terminal(const char* name, GraphNode* node1, GraphNode* node2) {
	Non_Terminal* node = new Non_Terminal(name);
	node->add_children(node1, node2);
	if( node->children.empty() ) {
		delete node;
		return NULL;
	}
	node->dotify();
	return node;
}

GraphNode* create_non_terminal(const char* name, GraphNode* node1) {
	Non_Terminal* node = new Non_Terminal(name);
	node->add_child(node1);
	if( node->children.empty() ) {
		delete node;
		return NULL;
	}
	node->dotify();
	return node;
}