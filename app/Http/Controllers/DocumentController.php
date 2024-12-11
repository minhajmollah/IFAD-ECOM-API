<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Document;
use App\Http\Resources\DocumentResource;
use App\Http\Resources\CategoryDocumentResource;
use App\Models\CategoryDocument;
use DB;

class DocumentController extends Controller
{
    /**
     * @method_name :- allCategory
     * --------------------------------------------------------
     * @param  :-
     * ?return :-  json($data)
     * author :-  API
     * created_by:- Abul Kalam Azad
     * created_at:- 08/12/2022 10:10:17
     * description :- this function given all categories data
     */
    public function allDocument111(){

        try {
            $documents=Document::all();
            $data[] = [
                'status' => true,
                'status_code' => 200,
                'message' => 'All Document List',
                'all_document_list' =>$documents,
                ];
            return response()->json($data);

        } catch (\Exception $exception) {
            report($exception);

            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }

    }
    public function allDocument111111(){
        try {
            $documents = Document::where('status','=',1)->orderBy(DB::raw('ISNULL(document_order), document_order'), 'ASC')->get();
            return DocumentResource::collection($documents);


        } catch (Exception $exception) {
            report($exception);

            return response()->json([
                'status' => false,
                'status_code' => 400,
                'message' => $exception->getMessage()
            ]);
        }
    }

	public function allDocument(){

        try {
             $categoryDocuments = CategoryDocument::where('status','=',1)->get();
            return CategoryDocumentResource::collection($categoryDocuments);


        } catch (\Exception $exception) {
            report($exception);

            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }

    }

}
