#include "linked_list.h"
#include <stdlib.h>

struct list_node
{
   struct list_node *prev, *next;
   ll_data_t data;
};

struct list
{
   struct list_node *first, *last;
};

// constructs a new (empty) list
struct list *list_create(void)
{
   struct list *new_list = malloc(sizeof(struct list));
   new_list->first = NULL;
   new_list->last = NULL;
   return new_list;
}

// counts the items on a list
size_t list_count(const struct list *list)
{
   size_t ans = 0;
   struct list_node *p = (*list).first;
   while (p != NULL)
   {
      ans += 1;
      p = (*p).next;
   }
   return ans;
}

// inserts item at back of a list
void list_push(struct list *list, ll_data_t item_data)
{
   if ((*list).first == NULL)
   {
      struct list_node *new_node = malloc(sizeof(struct list_node));
      new_node->prev = NULL;
      new_node->data = item_data;
      new_node->next = NULL;
      (*list).first = new_node;
      (*list).last = new_node;
   }
   else
   {
      struct list_node *new_node = malloc(sizeof(struct list_node));
      new_node->prev = list->last;
      new_node->data = item_data;
      list->last->next = new_node;
      (*list).last = new_node;
   }
}

// removes item from back of a list
ll_data_t list_pop(struct list *list)
{
   if ((*list).last == NULL)
   {
      return -1;
   }
   else if ((*list).first == (*list).last)
   {
      ll_data_t ans = list->last->data;
      free(list->last);
      list->first = NULL;
      list->last = NULL;
      return ans;
   }
   else
   {
      ll_data_t ans = list->last->data;
      struct list_node *p = list->last;
      list->last = list->last->prev;
      free(p);
      return ans;
   }
}

// inserts item at front of a list
void list_unshift(struct list *list, ll_data_t item_data)
{
   if (list->first == NULL)
   {
      struct list_node *new_node = malloc(sizeof(struct list_node));
      new_node->data = item_data;
      new_node->next = NULL;
      new_node->prev = NULL;
      list->first = new_node;
      list->last = new_node;
   }
   else {
      struct list_node *new_node = malloc(sizeof(struct list_node));
      new_node->data = item_data;
      new_node->prev = NULL;
      new_node->next = list->first;
      list->first->prev = new_node;
      list->first = new_node;
   }
}

// removes item from front of a list
ll_data_t list_shift(struct list *list) {
   if ((*list).first == NULL)
   {
      return -1;
   }
   else if ((*list).first == (*list).last)
   {
      ll_data_t ans = list->first->data;
      free(list->first);
      list->first = NULL;
      list->last = NULL;
      return ans;
   }
   else
   {
      ll_data_t ans = list->first->data;
      struct list_node *p = list->first;
      list->first = list->first->next;
      free(p);
      return ans;
   }
}

// deletes a node that holds the matching data
void list_delete(struct list *list, ll_data_t data) {
   struct list_node *p = list->first;
   while (p != NULL) {
      if (p->data == data) {
         if (p->prev == NULL) {
            list->first = p->next;
         } else {
            p->prev->next = p->next;
         }
         if (p->next == NULL) {
            list->last = p->prev;
         } else {
            p->next->prev = p->prev;
         }
         free(p);
      }
      p = p->next;
   }
}

// destroys an entire list
// list will be a dangling pointer after calling this method on it
void list_destroy(struct list *list) {
   if (list != NULL) {
      struct list_node *p = list->first;
      while (p != NULL) {
         struct list_node *q = p;
         p = p->next;
         free(q);
      }
   }
   free(list);
}