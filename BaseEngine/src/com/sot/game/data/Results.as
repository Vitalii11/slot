package com.sot.game.data 
{
	import com.sot.game.models.GameModel;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class Results 
	{
		
		public function Results() 
		{
			
		}
		
		private static var lines:Array = 
		[
			[2, 5, 8, 11, 14], //1
			[1, 4, 7, 10, 13], //2
			[3, 6, 9, 12, 15], //3
			[2, 5, 9, 11, 13], //4
			[3, 5, 7, 11, 15], //5
			[2, 4, 7, 10, 14], //6
			[2, 6, 9, 12, 14], //7
			[1, 4, 8, 12, 15], //8
			[3, 6, 8, 10, 13], //9
			[2, 6, 8, 10, 14], //10
			[2, 4, 8, 12, 14], //11
			[1, 5, 8, 11, 13], //12
			[3, 5, 8, 11, 15], //13
			[1, 5, 7, 11, 13], //14
			[3, 5, 9, 11, 15], //15
			[2, 5, 7, 11, 14], //16
			[2, 5, 9, 11, 14], //17
			[1, 4, 9, 10, 13], //18
			[3, 6, 7, 12, 15], //19
			[1, 6, 9, 12, 13], //20
			[3, 4, 7, 10, 15], //21
			[2, 6, 7, 12, 14], //22
			[2, 4, 9, 10, 14], //23
			[1, 6, 7, 12, 13], //24
			[3, 4, 9, 10, 15]  //25
		];
		
		private static var elementsCombinations:Object = {
		1: {
			2: { win: 2, freespin: 0 },
			3: { win: 30, freespin: 0 },
			4: { win: 12, freespin: 0 },
			5: { win: 800, freespin: 0 }
			},
		2: {
			2: { win: 2, freespin: 0 },
			3: { win: 30, freespin: 0 },
			4: { win: 12, freespin: 0 },
			5: { win: 800, freespin: 0 }
			},
		3: {
			2: { win: 2, freespin: 0 },
			3: { win: 30, freespin: 0 },
			4: { win: 12, freespin: 0 },
			5: { win: 800, freespin: 0 }
			},
		4: {
			2: { win: 2, freespin: 0 },
			3: { win: 30, freespin: 0 },
			4: { win: 12, freespin: 0 },
			5: { win: 800, freespin: 0 }
			},
		5: {
			2: { win: 2, freespin: 0 },
			3: { win: 30, freespin: 0 },
			4: { win: 12, freespin: 0 },
			5: { win: 800, freespin: 0 }
			},
		6: {
			2: { win: 2, freespin: 0 },
			3: { win: 30, freespin: 0 },
			4: { win: 12, freespin: 0 },
			5: { win: 800, freespin: 0 }
			},
		7: {
			2: { win: 2, freespin: 0 },
			3: { win: 30, freespin: 0 },
			4: { win: 12, freespin: 0 },
			5: { win: 800, freespin: 0 }
			},
		8: {
			2: { win: 2, freespin: 0 },
			3: { win: 30, freespin: 0 },
			4: { win: 12, freespin: 0 },
			5: { win: 800, freespin: 0 }
			},
		9: {
			2: { win: 2, freespin: 0 },
			3: { win: 30, freespin: 0 },
			4: { win: 12, freespin: 0 },
			5: { win: 800, freespin: 0 }
			},
		10: {
			2: { win: 2, freespin: 0 },
			3: { win: 30, freespin: 0 },
			4: { win: 12, freespin: 0 },
			5: { win: 800, freespin: 0 }
			},
		11: {
			2: { win: 2, freespin: 0 },
			3: { win: 30, freespin: 0 },
			4: { win: 12, freespin: 0 },
			5: { win: 800, freespin: 0 }
			},
		12: {
			2: { win: 2, freespin: 0 },
			3: { win: 30, freespin: 0 },
			4: { win: 12, freespin: 0 },
			5: { win: 800, freespin: 0 }
			},
		13: {
			2: { win: 2, freespin: 0 },
			3: { win: 30, freespin: 0 },
			4: { win: 12, freespin: 0 },
			5: { win: 800, freespin: 0 }
			}
		};
		
		public static function generateResult(result:Object):Object
		{
			//прописать для каждого итема, возможные выигрышные комбинации, по позициям и в зависимости от колл-ва линний
			
			/*var linesData:Object = { 
				1: {
					//items
					1: { 
						1:[2, 5],
						2:[2, 5, 8],
						3:[2, 5, 8, 11],
						4:[2, 5, 8, 11, 14]
					},
					2: { },
					3: { },
					4: { },
					5: { },
					6: { },
					7: { },
					8: { },
					9: { },
					10: { },
					11: { },
					12: { },
					13: { }
				},
				2: { },
				3: { },
				4: { },
				5: { },
				6: { },
				7: { },
				8: { },
				9: { },
				10: { },
				11: { },
				12: { },
				13: { },
				14: { },
				15: { }
			};
			
			for (var item:* in result) {
				result[item];
			}
			for (var i:int = 0; i < lines.length; i++) 
			{
				for (var j:int = 0; j < lines[i].length; j++) 
				}
					
				}
			}*/
				
			var resultData:Object = { };
			resultData['win'] = 0;
			resultData['freeSpins'] = 0;
			resultData['mana'] = 0;
			resultData['lines'] = [];
				
			for (var i:int = 0; i < GameModel.lines; i++) 
			{
				
				var lineItems:Array = getLineItems(i, result);
				
				var resultLine:Object = checkCoincidence(lineItems, i+1);
				resultData['win'] += resultLine.win;
				resultData['freeSpins'] += resultLine.freeSpins;
				resultData['mana'] += resultLine.mana;
				
				if(resultLine.line > 0)
					resultData.lines.push(resultLine.line);
			}
			
			return resultData;
		}
		
		private static function checkCoincidence(arrItems:Array, line:int):Object
		{
			var result:Object = { };
			result['win'] = 0;
			result['freeSpins'] = 0;
			result['mana'] = 0;
			result['line'] = 0;
			
			//for (var i:int = 0; i < arrItems.length; i++) 
			//{
				//
			//}
			var count:int = 0;
			
			if (arrItems[0] == arrItems[1]) {
				count = 2;
			}
			
			if (count > 0 && arrItems[0] == arrItems[2])
				count = 3;
				
			if (count == 3 && arrItems[0] == arrItems[3])
				count = 4;
				
			if (count == 4 && arrItems[0] == arrItems[4])
				count = 5;
				
			if (count > 0) {
				result.win = elementsCombinations[arrItems[0]][count].win;
				result.freeSpins = elementsCombinations[arrItems[0]][count].freespin;
				result.line = line;
			}
			
			return result;
		}
		
		private static function getLineItems(line:int, allItems:Object):Array
		{
			var lineItems:Array = [];
			for (var j:int = 0; j < lines[line].length; j++) 
			{
				lineItems.push(allItems[lines[line][j]]); 
			}
			
			return lineItems;
		}
		
	}

}