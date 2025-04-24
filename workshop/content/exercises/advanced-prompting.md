# Advanced Prompting 

In this section we will explore how to use advanced prompting techniques to create better context windows. These prompting techniques include: 
- Zero-shot prompting
- In Context Learning
- One-shot prompting
- Few-shot Prompting
- Chain of Thoughts

**Zero-shot Prompting**
Large language models (LLMs) today, such as GPT-4, llama and Claude 3, are tuned to follow instructions and are trained on large amounts of data. Large-scale training makes these models capable of performing some tasks in a "zero-shot" manner. Zero-shot prompting means that the prompt used to interact with the model won't contain examples or demonstrations. The zero-shot prompt directly instructs the model to perform a task without any additional examples to steer it.

```
Classify the text into neutral, negative or positive. 

Text: I think the vacation is okay.
Sentiment:
```
**In Context Learning**
A prompt engineering technique where tasks are integrated into a prompt - This approach allows pre-trained LLMs to address new tasks without fine-tuning the model. It has mainly 2 variations
- One-Shot prompting
- Few-shot prompting

**One-shot prompting**
To improve the results, we provide one example. The LLM tries to match the provided example pattern while producing the result.
```
Classify the sentiment of the following text as positive, negative, or neutral.
 Text: The product is terrible.
 Sentiment: Negative
Text: I think the vacation was okay. 
Sentiment:
```

**Few-shot Prompting**
To improve the results, we provide a few examples. The LLM tries to match the provided example pattern while producing the result.

```
Classify the sentiment of the following text as positive, negative, or neutral.
Text: The product is terrible. Sentiment: Negative
Text: Super helpful, worth it Sentiment: Positive
Text: It doesnt work! Sentiment:
```
Few-shot prompting to extract structured information from unstructured text
```
INPUT: Software Engineer - Python specialist needed at TechCorp. 5+ years experience required. Salary range $90,000 - $120,000. Remote work available. Apply by June 30, 2024. 
OUTPUT: Position: Software Engineer Specialization: Python Company: TechCorp Experience Required: 5+ years Salary Range: $90,000 - $120,000 Work Type: Remote Application Deadline: June 30, 2024
INPUT: Marketing Manager for GlobalBrand. MBA preferred. 3-5 years in consumer goods marketing. $75K-$95K DOE. Hybrid work model. Applications close July 15, 2024. 
OUTPUT: Position: Marketing Manager Company: GlobalBrand Education: MBA preferred Experience Required: 3-5 years Industry: Consumer goods Salary Range: $75,000 - $95,000 Work Type: Hybrid Application Deadline: July 15, 2024

INPUT: Data Scientist wanted at AI Innovations Ltd. PhD in Computer Science or related field. Minimum 2 years industry experience. Competitive salary €60,000 - €80,000 based on experience. On-site work in Berlin office. Apply by August 31, 2024. 
OUTPUT:
```
Few-Shot Prompting for Content Creation. Create concise travel itinerary descriptions for different types of vacations.
```
Destination: Tokyo, Japan Trip Type: Cultural Exploration 
Itinerary: A 5-day immersion in Tokyo's blend of tradition and modernity. Visit ancient temples like Senso-ji, then explore futuristic districts like Akihabara. Experience a tea ceremony, try hands-on workshops in traditional crafts, and end with a day trip to Mt. Fuji for breathtaking views of Japan's iconic landmark.

Destination: Costa Rica Trip Type: Eco-Adventure 
Itinerary: 7 days of natural wonders and adrenaline rushes. Start in the Arenal Volcano area for hiking and zip-lining, then head to Monteverde Cloud Forest for canopy walks and wildlife spotting. Finish at Manuel Antonio National Park, combining rainforest exploration with relaxation on pristine beaches.

Destination: Rome, Italy Trip Type: Culinary Journey 
Itinerary: A 6-day feast for the senses in the Eternal City. Begin with a pasta-making class, followed by guided food tours through trendy Trastevere and historic Jewish Ghetto. Visit local markets, enjoy wine tasting in the Roman countryside, and cap off the trip with a Michelin-starred dining experience.

Destination: New Zealand Trip Type: Lord of the Rings Fan Tour Itinerary:
```
**Chain of Thoughts**
To encourage the AI model to be factual by forcing it to follow a series of steps in its reasoning. 
chain-of-thought (CoT) prompting enables complex reasoning capabilities through intermediate reasoning steps. You can combine it with few-shot prompting to get better results on more complex tasks that require reasoning before responding


Zero-shot COT example with template
```
What European soccer team won the Champions League the year Barcelona hosted the
Olympic games?

Let’s think step by step. Provide reasoning.
```
In a few-shot CoT, the model is provided with a few examples of problems along with their step-by-step solutions to guide its reasoning process
```
Q: Michael had 58 golf balls. On tuesday, he lost 23 golf balls. On wednesday, he lost 2 more. How many golf balls did he have at the end of wednesday?
A: Michael started with 58 golf balls. After losing 23 on tuesday, he had 58-23=35. After losing 2 more, he had 35-2=33 golf balls. The answer is 33.
Q: If there are 3 cars in the parking lot and 2 more cars arrive, how many cars are in the parking lot? 
A: There are originally 3 cars. 2 more cars arrive. 3+2=5. The answer is 5.
Q: There were nine computers in the server room. Five more computers were installed each day, from monday to thursday. How many computers are now in the server room?
A: There were originally 9 computers. For each of 4 days, 5 more computers were added. So 5*4=20 computers were added. 9+20 is 29. The answer is 29.
Q: Shawn has five toys. For Christmas, he got two toys each from his mom and dad. How many toys does he have now? 
A: Shawn started with 5 toys. If he got 2 toys each from his mom and dad, then that is 4 more toys. 5+4=9. The answer is 9. 
Q: Leah had 32 chocolates and her sister had 42. If they ate 35, how many pieces do they have left in total? 
A: Originally, Leah had 32 chocolates. Her sister had 42. So in total they had 32+42=74. After eating 35, they had 74-35=39. The answer is 39.
Q: Tracy used a piece of wire 4 feet long to support tomato plants in the garden.The wire was cut into pieces 6 inches long. How many pieces did she obtain?
A: 
```