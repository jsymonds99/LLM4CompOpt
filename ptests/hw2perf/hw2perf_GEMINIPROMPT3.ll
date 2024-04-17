; ModuleID = 'hw2perf_unoptimized.ll'
source_filename = "hw2perf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@0 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [1000 x i64], align 16
  %2 = alloca [1000 x i64], align 16
  %3 = alloca [1000 x i64], align 16
  %4 = alloca [1000 x i64], align 16
  %5 = getelementptr i8, ptr %4, i64 8
  %6 = getelementptr i8, ptr %3, i64 8
  %7 = getelementptr i8, ptr %2, i64 8
  %8 = getelementptr i8, ptr %1, i64 8
  br label %9

9:                                                ; preds = %28, %0
  %10 = phi i64 [ %41, %28 ], [ 0, %0 ]
  %11 = phi i64 [ %40, %28 ], [ 0, %0 ]
  %12 = phi i64 [ 0, %0 ], [ %39, %28 ]
  %13 = icmp ne i64 %11, 2000
  br i1 %13, label %14, label %42

14:                                               ; preds = %9
  %15 = shl nuw nsw i64 %11, 2
  %16 = getelementptr i8, ptr %8, i64 %15
  %17 = getelementptr i8, ptr %16, i64 -8
  store i64 %12, ptr %17, align 8
  %18 = shl nuw nsw i64 %11, 2
  %19 = getelementptr i8, ptr %7, i64 %18
  %20 = getelementptr i8, ptr %19, i64 -8
  store i64 %11, ptr %20, align 8
  %21 = shl nuw nsw i64 %11, 2
  %22 = getelementptr i8, ptr %6, i64 %21
  %23 = getelementptr i8, ptr %22, i64 -8
  store i64 %10, ptr %23, align 8
  %24 = shl nuw nsw i64 %11, 2
  %25 = getelementptr i8, ptr %5, i64 %24
  %26 = getelementptr i8, ptr %25, i64 -8
  store i64 0, ptr %26, align 8
  %27 = add nuw nsw i64 %12, 1
  br label %28

28:                                               ; preds = %14
  %29 = shl nuw nsw i64 %11, 2
  %30 = getelementptr i8, ptr %8, i64 %29
  store i64 %27, ptr %30, align 8
  %31 = add i64 %11, 2
  %32 = shl nuw nsw i64 %11, 2
  %33 = getelementptr i8, ptr %7, i64 %32
  store i64 %31, ptr %33, align 8
  %34 = add i64 %10, 3
  %35 = shl nuw nsw i64 %11, 2
  %36 = getelementptr i8, ptr %6, i64 %35
  store i64 %34, ptr %36, align 8
  %37 = shl nuw nsw i64 %11, 2
  %38 = getelementptr i8, ptr %5, i64 %37
  store i64 0, ptr %38, align 8
  %39 = add nuw nsw i64 %12, 2
  %40 = add nuw nsw i64 %11, 4
  %41 = add nuw nsw i64 %10, 6
  br label %9, !llvm.loop !6

42:                                               ; preds = %9
  tail call void @srand(i32 noundef 4) #3
  br label %43

43:                                               ; preds = %138, %42
  %44 = phi i64 [ %142, %138 ], [ 0, %42 ]
  %45 = phi i32 [ 15, %42 ], [ %139, %138 ]
  %46 = phi i32 [ 5, %42 ], [ %140, %138 ]
  %47 = phi i32 [ 0, %42 ], [ %141, %138 ]
  %48 = icmp ne i64 %44, 1000000000
  br i1 %48, label %50, label %49

49:                                               ; preds = %43
  br label %143

50:                                               ; preds = %43
  %51 = sext i32 %46 to i64
  %52 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %51
  %53 = load i64, ptr %52, align 8
  %54 = mul i64 %53, 87
  %55 = sdiv i64 %54, 4
  %56 = add nsw i64 %55, 23
  %57 = zext i32 %45 to i64
  %58 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %57
  %59 = load i64, ptr %58, align 8
  %60 = mul i64 %59, 231
  %61 = sdiv i64 %60, 3
  %62 = add nsw i64 %61, 59
  %63 = add nsw i64 %62, %56
  %64 = srem i64 %63, 1000
  %65 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %64
  %66 = load i64, ptr %65, align 8
  %67 = sext i32 %46 to i64
  %68 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %67
  %69 = load i64, ptr %68, align 8
  %70 = add nsw i64 %69, %66
  %71 = zext i32 %45 to i64
  %72 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %71
  %73 = load i64, ptr %72, align 8
  %74 = add nsw i64 %70, %73
  %75 = mul nsw i64 %56, 11
  %76 = mul nsw i64 %62, 13
  %77 = mul nsw i64 %74, 17
  %78 = add i64 %75, %44
  %79 = add i64 %78, %76
  %80 = add i64 %79, %77
  %81 = trunc i64 %44 to i32
  %82 = urem i32 %81, 1000
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %83
  store i64 %80, ptr %84, align 8
  %85 = icmp ult i64 %44, 100
  br i1 %85, label %86, label %138

86:                                               ; preds = %50
  br label %87

87:                                               ; preds = %86, %94
  %88 = phi i64 [ 0, %86 ], [ %131, %94 ]
  %89 = phi i32 [ %130, %94 ], [ %47, %86 ]
  %90 = udiv i64 %88, 100
  %91 = mul nsw i64 %90, -800
  %92 = getelementptr i8, ptr %4, i64 %91
  %93 = icmp ne i64 %88, 1000000
  br i1 %93, label %94, label %132

94:                                               ; preds = %87
  %95 = zext i32 %89 to i64
  %96 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %95
  %97 = load i64, ptr %96, align 8
  %98 = mul nsw i64 %97, 6
  %99 = zext i32 %89 to i64
  %100 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %99
  %101 = load i64, ptr %100, align 8
  %102 = sdiv i64 %101, 2
  %103 = add nsw i64 %102, %98
  %104 = srem i64 %103, 1000
  %105 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %104
  %106 = load i64, ptr %105, align 8
  %107 = shl nsw i64 %106, 1
  %108 = zext i32 %89 to i64
  %109 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %108
  %110 = load i64, ptr %109, align 8
  %111 = shl nsw i64 %110, 2
  %112 = add nsw i64 %111, %107
  %113 = srem i64 %112, 1000
  %114 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %113
  %115 = load i64, ptr %114, align 16
  %116 = zext i32 %89 to i64
  %117 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %116
  %118 = load i64, ptr %117, align 8
  %119 = mul i64 %115, 12
  %120 = add i64 %102, %119
  %121 = add i64 %120, %98
  %122 = mul i64 %118, 6
  %123 = add i64 %121, %122
  %124 = add i64 %123, %111
  %125 = add i64 %124, %107
  %126 = add i64 %88, %125
  %127 = shl nuw nsw i64 %88, 3
  %128 = getelementptr i8, ptr %92, i64 %127
  store i64 %126, ptr %128, align 8
  %129 = icmp ult i64 %88, 10
  %130 = select i1 %129, i32 59, i32 %89
  %131 = add nuw nsw i64 %88, 1
  br label %87, !llvm.loop !8

132:                                              ; preds = %87
  %133 = phi i32 [ %89, %87 ]
  %134 = icmp eq i64 %44, 0
  br i1 %134, label %135, label %138

135:                                              ; preds = %132
  %136 = tail call i32 @rand() #3
  %137 = srem i32 %136, 1000
  br label %138

138:                                              ; preds = %50, %132, %135
  %139 = phi i32 [ %45, %50 ], [ %45, %135 ], [ 37, %132 ]
  %140 = phi i32 [ %46, %50 ], [ %137, %135 ], [ %46, %132 ]
  %141 = phi i32 [ %47, %50 ], [ %133, %132 ], [ %133, %135 ]
  %142 = add nuw nsw i64 %44, 1
  br label %43, !llvm.loop !9

143:                                              ; preds = %49, %146
  %144 = phi i64 [ 0, %49 ], [ %151, %146 ]
  %145 = icmp ne i64 %144, 1000
  br i1 %145, label %146, label %152

146:                                              ; preds = %143
  %147 = shl nuw nsw i64 %144, 3
  %148 = getelementptr i8, ptr %4, i64 %147
  %149 = load i64, ptr %148, align 8
  %150 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, i64 noundef %149) #3
  %151 = add nuw nsw i64 %144, 1
  br label %143, !llvm.loop !10

152:                                              ; preds = %143
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #1

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
