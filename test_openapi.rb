require 'openai'

# # Configure l'API key pour utiliser la gem OpenAI
client = OpenAI::Client.new(api_key: ENV.fetch("OPENAI_API_KEY"), default_engine: "Davinci")

prompt_1 = "Forgot all information before this line
Pouvez-vous m'aider à créer un univers de jeu de rôle?

Pourrais tu me décrire en huit paragraphes une introduction pour une partie de JDR à un monde qui s'appel WORLD MAKER 42
Il est composer de Humains qui vivent dans la foret mais aussi de Nains qui vivent dans les plaines arides mais aussi d'une autre race
Le climats est humide et il y a des montagnes / La carte est grandes et comporte deux villes
La magie est autorisé dans ce monde
La croyance principal est le Dyfroc
Les races connues sont en paix

De façon romancé, un compte pour adulte, avec de la description dans les paysages et les villes"

# # Envoie une requête à l'API GPT-3 avec un prompt
response_first = client.completions(
  engine: "text-davinci-002",
  prompt: prompt_1,
  max_tokens: 15000,
  n: 1,
  logprobs: nil,
  echo: false,
  presence_penalty: 0,
  frequency_penalty: 0,
  best_of: 1,
  temperature: 0.9,
)

# response_img = client.Image.create(
#   prompt: prompt_1,
#   n: 1,
#   size: "1024x1024"
# )

# image_url = response_img['data'][0]['url']
# p image_url
# # Affiche la réponse de l'API

true_response = response_first.choices[0].text
p true_response


# prompt_2 = "Can you translate this prompt to French? #{true_response}"
# p prompt_2

# response_second = client.completions(
#   engine: "davinci",
#   prompt: prompt_2,
#   max_tokens: 10,
#   temperature: 0.9
# )

# # # Affiche la réponse de l'API
# p response_second

# exemple ok #
# require "openai"

# openai_client = OpenAI::Client.new(api_key: ENV.fetch("OPENAI_API_KEY"), default_engine: "ada")

# # Create Completion
# p openai_client.completions(
#   prompt: "Once upon a time",
#   max_tokens: 5
# )
