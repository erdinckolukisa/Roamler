# Roamler Home Take Task
## Erdinc Kolukisa
### erdinckolukisa@gmail.com

## XCode 14.0.1 is used for development
## Tested using iPhone 14 Plus

## Description

The application has two views. MainListView and RecipeDetailView
 
In the first screen (MainListView) user can display a list of recipes that contains beers as ingredient. Each element in the list is represented by RecipeRow which has recipe image and also recipe title. 
MainListScreen uses MainListViewModel for business layer. All logic (e.g checking internet, fetching data from API, fetching data from persistent storage) is implemented here 

In the second screen (RecipeDetailView) user can display the details of the selected recipe.
RecipeDetailView uses RecipeDetailViewModel. RecipeDetailViewModel is created with the Recipe object when user selects a recipe in the main list. In this view model I extract some datas (e.g image, title, like count) that we display to the user. 

For networking Networking protocol is created and both WebAPI conforms to this protocol. WebApi uses URLSession with publisher version for networking. By default WebAPi is injected to viewmodel but any other implementation which conforms Networking protocol could also be injected without any side effects.

MVVM pattern was used and SOLID principles were used as much as I could. Some Unit Tests were created.

I used Combine for aysnchronous tasks.

## Used Libraries

I used Kingfisher library for image caching.

I used Reachability library to detect internet status.

I would be glad to discuss any questions in the interview.

# Note For Reviewers

I used Combine for aysnchronous tasks. (Only in one function I used completion closure to demonstrate I can apply this logic too)

I used only hasError property in MainListViewModel. Beside that I could add a property for error and handle it in the error screen but just because I didn't know what error screen will look like then I decided to keep error screen with hardcoded text. It is easy to handle errors in this screen still with this structure. 
