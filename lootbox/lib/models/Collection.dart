import 'package:flutter/material.dart';

class Collection {
  final String? id, image, title, description;
  final Color? color;

  Collection({
    this.id,
    this.image,
    this.title,
    this.description,
    this.color,
  });
}

// Test Data
List<Collection> collections = [
  Collection(
    title: 'Abstract', 
    id: 'nft-1', 
    image: 'https://images.unsplash.com/photo-1618386230353-3631c1365be2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80'
  ),
  Collection(
    title: 'Dragons', 
    id: 'nft-2', 
    image: 'https://images.unsplash.com/photo-1610926597998-fc7f2c1b89b0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80'
  ),
  Collection(
    title: 'Ladies', 
    id: 'nft-3', 
    image: 'https://images.unsplash.com/photo-1618510050510-d0903984e131?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80'
  ),
  Collection(
    title: 'Space', 
    id: 'nft-4', 
    image: 'https://images.unsplash.com/photo-1581822261290-991b38693d1b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80'
  ),
  Collection(
    title: 'Abstract', 
    id: 'nft-5', 
    image: 'https://images.unsplash.com/photo-1618386230353-3631c1365be2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80'
  ),
  Collection(
    title: 'Dragons', 
    id: 'nft-6', 
    image: 'https://images.unsplash.com/photo-1610926597998-fc7f2c1b89b0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80'
  ),
  Collection(
    title: 'Ladies', 
    id: 'nft-7', 
    image: 'https://images.unsplash.com/photo-1618510050510-d0903984e131?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80'
  ),
  Collection(
    title: 'Space', 
    id: 'nft-8', 
    image: 'https://images.unsplash.com/photo-1581822261290-991b38693d1b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80'
  ),
  Collection(
    title: 'Abstract', 
    id: 'nft-9', 
    image: 'https://images.unsplash.com/photo-1618386230353-3631c1365be2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80'
  ),
  Collection(
    title: 'Dragons', 
    id: 'nft-10', 
    image: 'https://images.unsplash.com/photo-1610926597998-fc7f2c1b89b0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80'
  ),
  Collection(
    title: 'Ladies', 
    id: 'nft-11', 
    image: 'https://images.unsplash.com/photo-1618510050510-d0903984e131?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80'
  ),
  Collection(
    title: 'Space', 
    id: 'nft-12', 
    image: 'https://images.unsplash.com/photo-1581822261290-991b38693d1b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80'
  ),
];