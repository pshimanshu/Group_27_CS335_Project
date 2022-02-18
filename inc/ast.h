#ifndef __AST_H__
#define __AST_H__

#include <string>
#include <vector>
#include <fstream>

template<typename Base, typename T>
inline bool instanceof(const T*) {
   return std::is_base_of<Base, T>::value;
}

class GraphNode {
	public:
		unsigned long long int id;
		int is_printed = 1;
		unsigned int line_num;
		unsigned int column;

		virtual void dotify() = 0;
		virtual void add_child(GraphNode* node);
		virtual void add_children (GraphNode* node1, GraphNode* node2);
		virtual void add_children (GraphNode* node1, GraphNode* node2, GraphNode* node3);
		virtual void add_children (GraphNode* node1, GraphNode* node2, GraphNode* node3, GraphNode* node4);
		unsigned long long int get_id();
	protected:
		GraphNode ();
		GraphNode (unsigned int line_num, unsigned int column );
		virtual ~GraphNode(void){};
};


class Terminal : public GraphNode {
	public:
		std::string name;
		std::string value;
		Terminal(const char * name_, const char * value_);
		Terminal(const char * name_, const char * value_,  unsigned int _line_num, unsigned int _column );
		void dotify();
		
};

class Non_Terminal : public GraphNode {
	public:
		std::string name;
		std::vector <GraphNode*> children;
		

		Non_Terminal(const char * name_);
		void add_child(GraphNode* node);
		void add_children (GraphNode* node1, GraphNode* node2);
		void add_children (GraphNode* node1, GraphNode* node2, GraphNode* node3);
		void add_children (GraphNode* node1, GraphNode* node2, GraphNode* node3, GraphNode* node4);
		void dotify();

};

unsigned long long int get_next_node_id();
GraphNode* create_terminal(const char * name, const char * value);
Terminal*  create_terminal(const char * name, const char * value, unsigned int line_num, unsigned int column);
GraphNode* create_non_terminal(const char * name);
GraphNode* create_non_terminal(const char* name, GraphNode* node1, GraphNode* node2, GraphNode* node3, GraphNode* node4, GraphNode* node5, GraphNode* node6, GraphNode* node7);
GraphNode* create_non_terminal(const char* name, GraphNode* node1, GraphNode* node2, GraphNode* node3, GraphNode* node4, GraphNode* node5, GraphNode* node6);
GraphNode* create_non_terminal(const char* name, GraphNode* node1, GraphNode* node2, GraphNode* node3, GraphNode* node4, GraphNode* node5);
GraphNode* create_non_terminal(const char* name, GraphNode* node1, GraphNode* node2, GraphNode* node3, GraphNode* node4);
GraphNode* create_non_terminal(const char* name, GraphNode* node1, GraphNode* node2, GraphNode* node3);
GraphNode* create_non_terminal(const char* name, GraphNode* node1, GraphNode* node2);
GraphNode* create_non_terminal(const char* name, GraphNode* node1);

void file_writer(std::string s);

#endif