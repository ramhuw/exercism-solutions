/// <reference path="./global.d.ts" />
// @ts-check

/**
 * Implement the functions needed to solve the exercise here.
 * Do not forget to export them so they are available for the
 * tests. Here an example of the syntax as reminder:
 *
 * export function yourFunction(...) {
 *   ...
 * }
 */

export function cookingStatus(n = null) {
    if (n === null) {
        return 'You forgot to set the timer.'
    } else if (n === 0) {
        return 'Lasagna is done.'
    } else {
        return 'Not done, please wait.'
    }
}

export function preparationTime(layers, n = 2) {
    return layers.length * n;
}

export function quantities(layers) {
    let a = 0;
    let b = 0;
    for (let l of layers) {
        if (l === 'noodles') {
            a += 50;
        } else if (l === 'sauce') {
            b += 0.2;
        }
    }
    return {
        noodles: a,
        sauce: b
    };
}

export function addSecretIngredient(friendsList, myList) {
    myList.push(friendsList[friendsList.length - 1]);
}

export function scaleRecipe(recipe, n = 1) {
    let new_recipe = {};
    for (let k in recipe) {
        new_recipe[k] = recipe[k] / 2 * n;
    }
    return new_recipe;
}